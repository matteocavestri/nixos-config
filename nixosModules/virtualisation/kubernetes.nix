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
          ]
          ++ (
            if systemSettings.host.hostname == "k3s-0"
            then []
            else [
              "--server https://k3s-0:6443"
            ]
          ));
        clusterInit = systemSettings.host.hostname == "k3s-0";
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
    networking.firewall = {
      allowedTCPPorts = [
        6443
        2379
        2380
      ];
      allowedUDPPorts = [
        8472
      ];
    };
  };
}
