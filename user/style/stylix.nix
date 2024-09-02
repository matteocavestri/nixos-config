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
  ];

  stylix = {
    autoEnable = false;
    polarity = themePolarity;
    image = pkgs.fetchurl {
      url = backgroundUrl;
      sha256 = backgroundSha256;
    };
    base16Scheme = ./. + themePath;
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
      alacritty.enable = false;
      kde.enable = true;
      kitty.enable = true;
      gtk.enable = true;
    };
  };

  home.file = {
    ".config/qt5ct/colors/oomox-current.conf".source = config.lib.stylix.colors {
      template = builtins.readFile ./oomox-current.conf.mustache;
      extension = ".conf";
    };
    ".config/Trolltech.conf".source = config.lib.stylix.colors {
      template = builtins.readFile ./Trolltech.conf.mustache;
      extension = ".conf";
    };
    ".config/kdeglobals".source = config.lib.stylix.colors {
      template = builtins.readFile ./Trolltech.conf.mustache;
      extension = "";
    };
    ".config/qt5ct/qt5ct.conf".text = pkgs.lib.mkBefore (builtins.readFile ./qt5ct.conf);
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

  home.packages = with pkgs; [
    libsForQt5.qt5ct
    pkgs.libsForQt5.breeze-qt5
    libsForQt5.breeze-icons
  ];

  qt = {
    enable = true;
    style.package = pkgs.adwaita-qt;
    style.name = "adwaita-dark";
    platformTheme.name = "qt5ct";
  };

  fonts.fontconfig.defaultFonts = {
    monospace = [userSettings.font];
    sansSerif = [userSettings.font];
    serif = [userSettings.font];
  };
}
