{
  imports = [
    ./hardware-configuration.nix
    ../../system/driver/nvidiagpu.nix
    ../../system/driver/qemuguest.nix
    ../../system/hardware/networkmanager.nix
    ../../system/hardware/zram.nix
    ../../system/services/nvidia-monitoring.nix
    ../../system/pkgs/container-nvidia.nix
  ];
  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "repl-flake"];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  networking.firewall.allowedTCPPorts = [
    22 # ssh
    2375 # docker sock (nextcloud)
    7860 # stable diffusion
    8095 # owncast
    8096 # jellyfin
    9001 # portainer agent
    9090 # prometheus
    9095 # cockpit
    9835 # nvidia monitoring
    11434 # ollama
    23000 # appapi
    23001 # appapi-1
    23002 # appapi-2
    23003 # appapi-3
    23004 # appapi-4
    23005 # appapi-5
  ];
  networking.firewall.allowedUDPPorts = [];

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
