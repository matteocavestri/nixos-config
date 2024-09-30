{
  lib,
  config,
  pkgs,
  systemSettings,
  ...
}: {
  options = {
    system.virtualisation = {
      k3s = {
        enable = lib.mkEnableOption "Enable k3s server";
        initServer = lib.mkEnableOption "Initialize HA server";
        addServer = lib.mkEnableOption "Option to add server to HA cluster";
      };
    };
  };
  config = lib.mkIf config.system.virtualisation.k3s.enable {
    virtualisation.docker.logDriver = "json-file";
    boot.supportedFilesystems = [
      "nfs"
    ];
    services = {
      rpcbind.enable = true;
      k3s = {
        enable = true;
        package = pkgs.k3s;
        role = "server";
        tokenFile = /var/lib/rancher/k3s/server/token;
        extraFlags = toString ([
            "--write-kubeconfig-mode \"0644\""
            "--disable servicelb"
            "--disable traefik"
            "--disable local-storage"
            "--kube-controller-manager-arg bind-address=0.0.0.0"
            "--kube-proxy-arg metrics-bind-address=0.0.0.0"
            "--kube-scheduler-arg bind-address=0.0.0.0"
            "--etcd-expose-metrics true"
            "--kubelet-arg containerd=/run/k3s/containerd/containerd.sock"
            "--kube-controller-manager-arg=node-monitor-grace-period=40s"
            "--kube-controller-manager-arg=pod-eviction-timeout=5m"
          ]
          ++ lib.mkOptional config.system.virtualisation.k3s.initServer [
            "--cluster-init"
            "--tls-san=192.168.1.210"
          ]
          ++ lib.mkOptional config.system.virtualisation.k3s.addServer [
            "--server=https://192.168.1.210:6443"
          ]);
      };
      openiscsi = {
        enable = true;
        name = "open-iscsi-${systemSettings.host.hostname}";
      };
    };
    system.activationScripts.kubevip = lib.mkIf (systemSettings.host.hostname == "k3s-01") ''
      mkdir -p /var/lib/rancher/k3s/server/manifests/
      ${pkgs.curl}/bin/curl -s https://kube-vip.io/manifests/rbac.yaml -o /var/lib/rancher/k3s/server/manifests/kube-vip.yaml
      cat <<EOF >> /var/lib/rancher/k3s/server/manifests/kube-vip.yaml
      ---
      apiVersion: apps/v1
      kind: DaemonSet
      metadata:
        creationTimestamp: null
        labels:
          app.kubernetes.io/name: kube-vip-ds
          app.kubernetes.io/version: v0.8.3
        name: kube-vip-ds
        namespace: kube-system
      spec:
        selector:
          matchLabels:
            app.kubernetes.io/name: kube-vip-ds
        template:
          metadata:
            creationTimestamp: null
            labels:
              app.kubernetes.io/name: kube-vip-ds
              app.kubernetes.io/version: v0.8.3
          spec:
            affinity:
              nodeAffinity:
                requiredDuringSchedulingIgnoredDuringExecution:
                  nodeSelectorTerms:
                  - matchExpressions:
                    - key: node-role.kubernetes.io/master
                      operator: Exists
                  - matchExpressions:
                    - key: node-role.kubernetes.io/control-plane
                      operator: Exists
            containers:
            - args:
              - manager
              env:
              - name: vip_arp
                value: "true"
              - name: port
                value: "6443"
              - name: vip_nodename
                valueFrom:
                  fieldRef:
                    fieldPath: spec.nodeName
              - name: vip_interface
                value: enp1s0f0
              - name: vip_cidr
                value: "32"
              - name: dns_mode
                value: first
              - name: cp_enable
                value: "true"
              - name: cp_namespace
                value: kube-system
              - name: vip_leaderelection
                value: "true"
              - name: vip_leasename
                value: plndr-cp-lock
              - name: vip_leaseduration
                value: "5"
              - name: vip_renewdeadline
                value: "3"
              - name: vip_retryperiod
                value: "1"
              - name: address
                value: 192.168.1.210
              - name: prometheus_server
                value: :2112
              image: ghcr.io/kube-vip/kube-vip:v0.8.3
              imagePullPolicy: IfNotPresent
              name: kube-vip
              resources: {}
              securityContext:
                capabilities:
                  add:
                  - NET_ADMIN
                  - NET_RAW
            hostNetwork: true
            serviceAccountName: kube-vip
            tolerations:
            - effect: NoSchedule
              operator: Exists
            - effect: NoExecute
              operator: Exists
        updateStrategy: {}
      EOF
    '';
    environment.systemPackages = with pkgs; [
      cifs-utils
      nfs-utils
    ];
    networking.firewall.enable = lib.mkForce false;
  };
}
