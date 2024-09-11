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
  breezeIconsFixed = pkgs.breeze-icons.overrideAttrs (oldAttrs: {
    postInstall = ''
      rm -f $out/share/icons/breeze/status/22/telegram-mute-panel.svg
    '';
  });
in {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  options = {
    user.services = {
      stylix.enable = lib.mkEnableOption "Enable stylix";
      gtkstyle.enable = lib.mkEnableOption "Enable gtk styling";
      qtstyle.enable = lib.mkEnableOption "Enable qt styling";
    };
  };

  config = {
    stylix = lib.mkIf config.user.services.stylix.enable {
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

    gtk = lib.mkIf config.user.services.gtkstyle.enable {
      enable = true;
      cursorTheme = {
        package = userSettings.appearance.cursorPkg;
        name = userSettings.appearance.cursor;
        size = 24;
      };
      iconTheme = {
        package = userSettings.appearance.iconsPkg;
        name = userSettings.appearance.icons;
      };
    };

    qt = lib.mkIf config.user.services.qtstyle.enable {
      enable = true;
      style.package = [
        pkgs.adwaita-qt
        pkgs.adwaita-qt6
      ];
      style.name = "adwaita-dark";
      platformTheme.name = "qt5ct";
    };

    home = {
      packages = with pkgs;
        lib.optionals config.user.services.qtstyle.enable [
          libsForQt5.qt5ct
          kdePackages.qt6ct
          breezeIconsFixed
          kdePackages.breeze
          kdePackages.breeze.qt5
          gnome.adwaita-icon-theme
          libsForQt5.qt5.qtbase
          kdePackages.qtbase
          kdePackages.qtwayland
          libsForQt5.qt5.qtwayland
        ];
      file = {
        ".config/qt5ct/colors/oomox-current.conf" = lib.mkIf (config.user.services.qtstyle.enable && config.user.services.stylix.enable) {
          source = config.lib.stylix.colors {
            template = builtins.readFile ./common/oomox-current.conf.mustache;
            extension = ".conf";
          };
        };
        ".config/qt6ct/colors/oomox-current.conf" = lib.mkIf (config.user.services.qtstyle.enable && config.user.services.stylix.enable) {
          source = config.lib.stylix.colors {
            template = builtins.readFile ./common/oomox-current.conf.mustache;
            extension = ".conf";
          };
        };
        ".config/qt5ct/qt5ct.conf" = lib.mkIf (config.user.services.qtstyle.enable && config.user.services.stylix.enable) {
          text = pkgs.lib.mkBefore (builtins.readFile ./common/qt5ct.conf);
        };
        ".config/qt6ct/qt6ct.conf" = lib.mkIf (config.user.services.qtstyle.enable && config.user.services.stylix.enable) {
          text = pkgs.lib.mkBefore (builtins.readFile ./common/qt6ct.conf);
        };
        ".currenttheme" = lib.mkIf config.user.services.stylix.enable {
          text = userSettings.appearance.theme;
        };
        # TODO: Move hyprpaper
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
  };
}
