{
  lib,
  config,
  ...
}: {
  imports = [
    ./modules/default.nix
  ];

  # Setup the default graphics card for wayland
  config = lib.mkIf config.hardware.asahi.enable {
    environment.sessionVariables = {
      WLR_DRM_DEVICES = "/dev/dri/card0";
    };
  };
}
