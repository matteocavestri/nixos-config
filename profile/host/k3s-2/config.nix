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
  };
}
