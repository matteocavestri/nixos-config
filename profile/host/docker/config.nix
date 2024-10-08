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
      nvidia-monitoring.enable = true;
    };
    virtualisation.docker.nvidiasupport = true;
  };
}
