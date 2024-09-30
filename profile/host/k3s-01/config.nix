{
  imports = [
    ./hardware-configuration.nix
  ];
  system = {
    config = {
      zram.enable = true;
      unfree.enable = true;
    };
    hardware = {
      gpu.intel = {
        enable = true;
        support32 = true;
        opencl = true;
        monitoring = true;
        newgpu5 = true;
      };
    };
    virtualisation.k3s.initServer = true;
  };

  # Initialize Certificate for KubeVIP
  services.k3s.extraFlags = toString [
    "--tls-san=192.168.1.210"
  ];
}
