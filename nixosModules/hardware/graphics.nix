{
  lib,
  config,
  ...
}: {
  options = {
    system.hardware.gpu = {
      opengl = {
        enable = lib.mkEnableOption "Enable Hardware Acceleration";
        support32 = lib.mkEnableOption "Support 32-bit";
      };
    };
  };

  config = {
    hardware.opengl = {
      # Enable generic graphics support
      enable = lib.mkIf config.system.hardware.gpu.opengl.enable true;
      driSupport = lib.mkIf config.system.hardware.gpu.opengl.enable true;

      # Eenable 32-bit graphics support
      driSupport32Bit = lib.mkIf config.system.hardware.gpu.opengl.support32 true;
    };
  };
}
