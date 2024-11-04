{
  lib,
  config,
  ...
}: {
  options = {
    system.system.kernel = {
      rustsupport = lib.mkEnableOption "Enable Rust support";
      increaseInotify = lib.mkEnableOption "Increase inotify kernel param to 512";
    };
  };
  config = {
    boot = {
      kernel = lib.mkIf config.system.system.kernel.increaseInotify {
        sysctl."fs.inotify.max_user_instances" = 512;
      };
      kernelPatches = lib.mkIf config.system.system.kernel.rustsupport [
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
  };
}
