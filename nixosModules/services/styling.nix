{
  lib,
  config,
  pkgs,
  userSettings,
  inputs,
  ...
}: let
  # Import theme and background from /themes directory
  themePath = "../../../themes/" + userSettings.appearance.theme + "/" + userSettings.appearance.theme + ".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes" + ("/" + userSettings.appearance.theme) + "/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../../themes" + ("/" + userSettings.appearance.theme) + "/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/" + ("/" + userSettings.appearance.theme) + "/backgroundsha256.txt");
in {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  options = {
    system.services.stylix.enable = lib.mkEnableOption "Enable global styling";
  };

  config = lib.mkIf config.system.services.stylix.enable {
    # Main stylix configuration
    stylix = {
      enable = true;
      autoEnable = false;

      # Theme definition and backgound
      polarity = themePolarity;
      image = pkgs.fetchurl {
        url = backgroundUrl;
        sha256 = backgroundSha256;
      };
      base16Scheme = ./. + themePath;

      # Cursor configuration
      cursor = {
        name = userSettings.appearance.cursor;
        package = userSettings.appearance.cursorPkg;
        size = 24;
      };

      # Font configuration
      fonts = {
        monospace = {
          name = userSettings.appearance.font;
          package = userSettings.appearance.fontPkg;
        };
        serif = {
          name = userSettings.appearance.font;
          package = userSettings.appearance.fontPkg;
        };
        sansSerif = {
          name = userSettings.appearance.font;
          package = userSettings.appearance.fontPkg;
        };
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-emoji-blob-bin;
        };
        sizes = {
          terminal = 12;
          applications = 12;
          popups = 12;
          desktop = 12;
        };
      };

      # Stylix targets
      targets = {
        lightdm.enable = true;
        gnome.enable = true;
        nixos-icons.enable = true;
        console.enable = true;
      };
    };
  };
}
