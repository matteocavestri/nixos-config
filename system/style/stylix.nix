{
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}: let
  themePath = "../../../themes/" + userSettings.theme + "/" + userSettings.theme + ".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes" + ("/" + userSettings.theme) + "/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../../themes" + ("/" + userSettings.theme) + "/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/" + ("/" + userSettings.theme) + "/backgroundsha256.txt");
in {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = false;
    polarity = themePolarity;
    image = pkgs.fetchurl {
      url = backgroundUrl;
      sha256 = backgroundSha256;
    };
    base16Scheme = ./. + themePath;
    cursor = {
      name = userSettings.cursor;
      package = userSettings.cursorPkg;
      size = 24;
    };
    fonts = {
      monospace = {
        name = userSettings.font;
        package = userSettings.fontPkg;
      };
      serif = {
        name = userSettings.font;
        package = userSettings.fontPkg;
      };
      sansSerif = {
        name = userSettings.font;
        package = userSettings.fontPkg;
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
    targets = {
      lightdm.enable = true;
      nixos-icons.enable = true;
      console.enable = true;
    };
  };
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
