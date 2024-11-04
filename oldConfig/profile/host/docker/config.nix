{
  imports = [
    ./hardware-configuration.nix
  ];

  system = {
    config = {
      zram.enable = true;
      unfree.enable = true;
    };
    hardware.gpu.nvidia = {
      enable = true;
      monitoring = true;
      cuda = true;
      cudnn = true;
    };
    services = {
      qemuguest.enable = true;
    };
    virtualisation.docker.nvidiasupport = true;
  };

  networking.firewall.allowedTCPPorts = [
    80    # Http Server Caddy
    443   # Https Server Caddy
    3000  # OpenWebUI
    3478  # Nextcloud Talk
    4000  # LiteLLM
    8080  # Nextcloud AIO
    11000 # Nextcloud Apache
    11434 # Ollama
  ];
  networking.firewall.allowedUDPPorts = [
    3478 # Nextcloud Talk UDP
  ];

  fileSystems = {
    "/var/lib/docker/volumes" = {
      device = "192.168.1.95:/mnt/Bigboy/Docker-Volume";
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
