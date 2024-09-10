{
  lib,
  config,
  ...
}: {
  options = {
    system.system.kernel.rustsupport = lib.mkEnableOption "Enable Rust support";
  };
  config = {
    boot.kernelPatches = lib.mkIf config.system.system.kernel.rustsupport [
      # Enable Rust files in the kernel source (More time to compile, memory safe ?)
      {
        name = "Rust Support";
        patch = null;
        features = {
          rust = true;
        };
      }
    ];
  };
}
