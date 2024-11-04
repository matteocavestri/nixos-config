{
  lib,
  config,
  ...
}: {
  options = {
    system.virtualisation.waydroid.enable = lib.mkEnableOption "Enable waydroid";
  };
  config = {
    # Enable waydroid support
    virtualisation.waydroid.enable = lib.mkIf config.system.virtualisation.waydroid.enable true;
  };
}
