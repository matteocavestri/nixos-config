{
  imports = [
    ./hardware-configuration.nix
  ];

  system = {
    config = {
      zram.enable = true;
      unfree.enable = true;
      pipewire = {
        enable = true;
      };
    };
    system.kernel.rustsupport = true;
    hardware = {
      gpu.amd = {
        enable = true;
        support32 = true;
        opencl = true;
        monitoring = true;
      };
    };
  };
}
