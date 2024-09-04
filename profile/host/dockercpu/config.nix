{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../../system/config/hardware/systemdboot.nix
    ../../../system/hardware/virtual/qemuguest.nix
    ../../../system/config/hardware/networkmanager.nix
    ../../../system/config/optimization/zram.nix
  ];

  networking.firewall.allowedTCPPorts = [
    22 # ssh
    80 # http (traefik) --> external
    443 # https (traefik) --> external
    3100 # loki
    8065 # mattermost
    8443 # mattermost calls --> external
    9095 # cockpit
    9091 # prometheus
    9099 # openwebui pipelines
    9998 # tika
  ];
  networking.firewall.allowedUDPPorts = [
    443 # http3 (traefik) --> external
    8443 # mattermost calls --> external
  ];

  fileSystems = {
    "/mnt/nfs/media" = {
      device = "192.168.1.95:/mnt/Bigboy/Media";
      fsType = "nfs";
      noCheck = true;
      options = [
        "proto=tcp"
        "soft"
        "nofail"
        "_netdev"
        "x-systemd.automount"
      ];
    };
  };
  fileSystems = {
    "/mnt/nfs/config" = {
      device = "192.168.1.95:/mnt/Bigboy/NFS/Config";
      fsType = "nfs";
      noCheck = true;
      options = [
        "proto=tcp"
        "soft"
        "nofail"
        "_netdev"
        "x-systemd.automount"
      ];
    };
  };
  fileSystems = {
    "/mnt/nfs/data" = {
      device = "192.168.1.95:/mnt/Bigboy/NFS/Data";
      fsType = "nfs";
      noCheck = true;
      options = [
        "proto=tcp"
        "soft"
        "nofail"
        "_netdev"
        "x-systemd.automount"
      ];
    };
  };
  fileSystems = {
    "/mnt/nfs/database" = {
      device = "192.168.1.95:/mnt/Bigboy/NFS/Database";
      fsType = "nfs";
      noCheck = true;
      options = [
        "proto=tcp"
        "soft"
        "nofail"
        "_netdev"
        "x-systemd.automount"
      ];
    };
  };
}
