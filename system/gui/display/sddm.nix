{
  pkgs,
  config,
  systemSettings,
  lib,
  ...
}: let
  resolution = systemSettings.monitor.resolution;
  screenWidth = builtins.isInt (builtins.elemAt (lib.splitString "x" resolution) 0);
  screenHeight = builtins.isInt (builtins.elemAt (lib.splitString "x" resolution) 1);
in {
  environment.systemPackages = with pkgs; [
    (sddm-chili-theme.override {
      themeConfig = {
        background = config.stylix.image;
        ScreenWidth = screenWidth;
        ScreenHeight = screenHeight;
        blur = true;
        recursiveBlurLoops = 3;
        recursiveBlurRadius = 5;
      };
    })
  ];
  # Configure xwayland
  services = {
    xserver = {
      enable = true;
    };
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        enableHidpi = true;
        theme = "chili";
        package = pkgs.sddm;
      };
    };
  };
}
