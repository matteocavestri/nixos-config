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
        role = "server";
        tokenFile = /var/lib/rancher/k3s/server/token;
        extraFlags = toString ([
            "--write-kubeconfig-mode \"0644\""
            "--cluster-init"
            "--disable servicelb"
            "--disable traefik"
            "--disable local-storage"
            "--tls-san=192.168.1.210"
            "--kube-controller-manager-arg bind-address=0.0.0.0"
            "--kube-proxy-arg metrics-bind-address=0.0.0.0"
            "--kube-scheduler-arg bind-address=0.0.0.0"
            "--etcd-expose-metrics true"
            "--kublet-arg containerd=/run/k3s/containerd/containerd.sock"
          ]
          ++ (
            if systemSettings.host.hostname == "k3s-01"
            then []
            else [
              "--server https://k3s-01:6443"
            ]
          ));
        clusterInit = systemSettings.host.hostname == "k3s-01";
      };
      openiscsi = {
        enable = true;
        name = "open-iscsi-${systemSettings.host.hostname}";
      };
    };
    environment.systemPackages = with pkgs; [
      cifs-utils
      nfs-utils
    ];
    networking.firewall.enable = lib.mkForce false;
  };
}
