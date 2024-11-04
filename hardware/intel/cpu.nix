{
  lib,
  config,
  types,
  ...
}: {
  options = {
    # Enable Intel CPU optimizations
    neve.hardware.intel.cpu.enable = lib.mkOption {
      type = types.bool;
      default = false;
    };
  };

  # Intel CPU Configurations
  config = lib.mkIf config.neve.hardware.intel.cpu.enable {
    # Enable Intel KVM Support
    boot.kernelModules = ["kvm-intel"];

    # Enable thermal daemon (Useful in laptops)
    services.thermald.enable = true;
  };
}
