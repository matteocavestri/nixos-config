{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.hardware.peripherals = {
      enable = lib.mkEnableOption "Enable Third party peripherals";
      logitechWheel = lib.mkEnableOption "Enable Logitech Wheel support";
    };
  };
  config = lib.mkIf config.system.hardware.peripherals.enable {
    environment.systemPackages = with pkgs;
      lib.mkIf config.system.hardware.peripherals.logitechWheel [
        linuxKernel.packages.linux_libre.new-lg4ff
        oversteer
      ];
  };
}
