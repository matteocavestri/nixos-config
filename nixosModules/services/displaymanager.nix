{
  lib,
  config,
  userSettings,
  pkgs,
  systemSettings,
  ...
}: let
  # Import theme and screen resolution for lightdm and sddm configurations
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes" + ("/" + userSettings.appearance.theme) + "/polarity.txt"));
  myLightDMTheme =
    if themePolarity == "light"
    then "Adwaita"
    else "Adwaita-dark";
  inherit (systemSettings.monitor) resolution;
  screenWidth = builtins.isInt (builtins.elemAt (lib.splitString "x" resolution) 0);
  screenHeight = builtins.isInt (builtins.elemAt (lib.splitString "x" resolution) 1);
in {
  options = {
    system.services.displaymanager = {
      lightdm.enable = lib.mkEnableOption "Enable LightDM";
      sddm.enable = lib.mkEnableOption "Enable SDDM";
    };
  };

  config = {
    services = {
      xserver = {
        enable = lib.mkIf (config.system.services.wayland.enable || config.system.services.x11.enable) true;
        displayManager = {
          # Lightdm main configuration
          lightdm = lib.mkIf config.system.services.displaymanager.lightdm.enable {
            enable = true;
            greeters.slick.enable = true;
            greeters.slick.theme.name = myLightDMTheme;
          };

          # Sddm main configuration
          sddm = lib.mkIf config.system.services.displaymanager.sddm.enable {
            enable = true;
            wayland.enable = true;
            enableHidpi = true;
            theme = "chili";
            package = pkgs.sddm;
          };
        };
      };
    };

    # Sddm theme override for stylix background
    environment = lib.mkIf config.system.services.displaymanager.sddm.enable {
      systemPackages = with pkgs; [
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
    };
  };
}
