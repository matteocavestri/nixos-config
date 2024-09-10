{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.config = {
      backlight.enable = lib.mkEnableOption "Enable monitors backlight control";
      touchpad.enable = lib.mkEnableOption "Enable touchpad support";
      iio.enable = lib.mkEnableOption "Enable iio sensors support";
    };
  };

  config = {
    services.libinput.enable = lib.mkIf config.system.config.touchpad.enable true;
    hardware.sensor.iio.enable = lib.mkIf config.system.config.iio.enable true;
    environment = lib.mkIf config.system.config.backlight.enable {
      systemPackages = with pkgs; [
        brightnessctl
      ];
    };
  };
}
