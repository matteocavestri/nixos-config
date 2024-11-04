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
  backgroundUrl = builtins.readFile (./. + "../../../themes" + ("/" + userSettings.appearance.theme) + "/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/" + ("/" + userSettings.appearance.theme) + "/backgroundsha256.txt");
  wallpaper = pkgs.fetchurl {
    url = backgroundUrl;
    sha256 = backgroundSha256;
  };
in {
  options = {
    system.services.displaymanager = {
      lightdm.enable = lib.mkEnableOption "Enable LightDM";
      sddm.enable = lib.mkEnableOption "Enable SDDM";
    };
  };

  # Default configuration for 24.05
  config = lib.mkIf (config.system.services.displaymanager.lightdm.enable || config.system.services.displaymanager.sddm.enable) {
    services =
      if lib.versionOlder (lib.versions.majorMinor lib.version) "24.11"
      then {
        xserver = lib.mkIf (config.system.services.wayland.enable || config.system.services.xorg.enable) {
          enable = true;
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
      }
      # Override configuration for 24.11 and newer
      else {
        xserver = lib.mkIf (config.system.services.displaymanager.lightdm.enable || config.system.services.xorg.enable) {
          enable = true;
          displayManager = {
            # Lightdm main configuration
            lightdm = lib.mkIf config.system.services.displaymanager.lightdm.enable {
              enable = true;
              greeters.slick.enable = true;
              greeters.slick.theme.name = myLightDMTheme;
            };
          };
        };
        displayManager = {
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

    # Sddm theme override for stylix background
    environment = lib.mkIf config.system.services.displaymanager.sddm.enable {
      systemPackages = with pkgs; [
        (sddm-chili-theme.override {
          themeConfig = {
            background = wallpaper;
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
