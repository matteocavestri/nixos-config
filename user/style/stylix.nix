{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}: let
  themePath = "../../../themes" + ("/" + userSettings.appearance.theme + "/" + userSettings.appearance.theme) + ".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes" + ("/" + userSettings.appearance.theme) + "/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../../themes" + ("/" + userSettings.appearance.theme) + "/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/" + ("/" + userSettings.appearance.theme) + "/backgroundsha256.txt");
in {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ./gtk.nix
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
      name = userSettings.appearance.cursor;
      package = userSettings.appearance.cursorPkg;
      size = 24;
    };
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
        name = "Noto Emoji";
        package = pkgs.noto-fonts-monochrome-emoji;
      };
      sizes = {
        terminal = 12;
        applications = 12;
        popups = 12;
        desktop = 12;
      };
    };
    targets = {
      kde.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      kitty.enable = true;
      mangohud.enable = true;
      lazygit.enable = true;
      fzf.enable = true;
      firefox.enable = true;
      bat.enable = true;
      btop.enable = true;
    };
  };
  home.file = {
    ".currenttheme".text = userSettings.appearance.theme;
    ".config/hypr/hyprpaper.conf".text =
      ''
        preload = ''
      + config.stylix.image
      + ''

        wallpaper = ,''
      + config.stylix.image
      + ''
      '';
  };
}
