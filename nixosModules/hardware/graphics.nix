# {
#   lib,
#   config,
#   ...
# }: {
#   options = {
#     system.hardware.gpu = {
#       enable = lib.mkEnableOption "Enable Hardware Acceleration";
#       support32 = lib.mkEnableOption "Support 32-bit";
#     };
#   };
#   config = lib.mkIf config.system.hardware.gpu.enable {
#     hardware = {
#       graphics = {
#         # Enable generic graphics support
#         enable = true;
#         driSupport = true;
#         # Enable 32-bit graphics support
#         driSupport32Bit = lib.mkIf config.system.hardware.gpu.support32 true;
#       };
#       opengl = {
#         # Enable generic graphics support
#         enable = true;
#         driSupport = true;
#         # Enable 32-bit graphics support
#         driSupport32Bit = lib.mkIf config.system.hardware.gpu.support32 true;
#       };
#     };
#   };
# }
{
  lib,
  config,
  ...
}: {
  options = {
    system.hardware.gpu = {
      enable = lib.mkEnableOption "Enable Hardware Acceleration";
      support32 = lib.mkEnableOption "Support 32-bit";
    };
  };

  config = lib.mkIf config.system.hardware.gpu.enable {
    hardware =
      if lib.versionOlder (lib.versions.majorMinor lib.version) "24.11"
      then {
        opengl = {
          # Enable generic graphics support for OpenGL
          enable = true;
          driSupport = true;

          # Enable 32-bit graphics support
          driSupport32Bit = lib.mkIf config.system.hardware.gpu.support32 true;
        };
      }
      else {
        graphics = {
          # Enable generic graphics support for modern versions
          enable = true;
          driSupport = true;

          # Enable 32-bit graphics support
          driSupport32Bit = lib.mkIf config.system.hardware.gpu.support32 true;
        };
      };
  };
}
