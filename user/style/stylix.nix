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
      kde.enable = true;
      kitty.enable = true;
      gtk.enable = true;
      gnome.enable = true;
      nixvim.enable = true;
      zellij.enable = true;
      xfce.enable = true;
      rofi.enable = true;
      mangohud.enable = true;
      lazygit.enable = true;
      hyprland.enable = true;
      fzf.enable = true;
      fuzzel.enable = true;
      firefox.enable = true;
      dunst.enable = true;
      bat.enable = true;
      btop.enable = true;
    };
  };

  qt = {
    enable = true;
    style.package = pkgs.adwaita-qt;
    style.name = "adwaita-dark";
    platformTheme.name = "qt5ct";
  };

  gtk = {
    enable = true;
    cursorTheme = {
      package = userSettings.cursorPkg;
      name = userSettings.cursor;
      size = 24;
    };
    iconTheme = {
      package = userSettings.iconsPkg;
      name = userSettings.icons;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  fonts.fontconfig.defaultFonts = {
    monospace = [userSettings.font];
    sansSerif = [userSettings.font];
    serif = [userSettings.font];
  };

  home = {
    packages = with pkgs; [
      libsForQt5.qt5ct
      libsForQt5.breeze-qt5
      libsForQt5.breeze-icons
      gnome.adwaita-icon-theme
    ];
    file = {
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
  };
}
