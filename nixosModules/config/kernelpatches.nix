{
  lib,
  config,
  ...
}: {
  options = {
    system.config.kernel.rustsupport = lib.mkEnableOption "Enable Rust support";
  };
  config = {
    boot.kernelPatches = lib.mkIf config.system.config.kernel.rustsupport [
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
