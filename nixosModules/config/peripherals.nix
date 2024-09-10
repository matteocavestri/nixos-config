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
    # Enable support for trackpads
    services.libinput.enable = lib.mkIf config.system.config.touchpad.enable true;

    # Enable support for iio sensors (light, accelerometer, etc)
    hardware.sensor.iio.enable = lib.mkIf config.system.config.iio.enable true;

    # Install brightnessctl to control monitors brightness
    environment = lib.mkIf config.system.config.backlight.enable {
      systemPackages = with pkgs; [
        brightnessctl
      ];
    };
  };
}
