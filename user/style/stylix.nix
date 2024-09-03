{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}: let
  themePath = "../../../themes" + ("/" + userSettings.theme + "/" + userSettings.theme) + ".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes" + ("/" + userSettings.theme) + "/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../../themes" + ("/" + userSettings.theme) + "/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/" + ("/" + userSettings.theme) + "/backgroundsha256.txt");
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
    ".currenttheme".text = userSettings.theme;
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
