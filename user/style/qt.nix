{
  pkgs,
  config,
  ...
}: let
  breezeIconsFixed = pkgs.breeze-icons.overrideAttrs (oldAttrs: {
    postInstall = ''
      rm -f $out/share/icons/breeze/status/22/telegram-mute-panel.svg
    '';
  });
in {
  qt = {
    enable = true;
    style.package = [
      pkgs.adwaita-qt
      pkgs.adwaita-qt6
    ];
    style.name = "adwaita-dark";
    platformTheme.name = "qt5ct";
  };
  home = {
    packages = with pkgs; [
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
      ".config/qt5ct/colors/oomox-current.conf".source = config.lib.stylix.colors {
        template = builtins.readFile ./qtconf/oomox-current.conf.mustache;
        extension = ".conf";
      };
      ".config/qt6ct/colors/oomox-current.conf".source = config.lib.stylix.colors {
        template = builtins.readFile ./qtconf/oomox-current.conf.mustache;
        extension = ".conf";
      };
      ".config/qt5ct/qt5ct.conf".text = pkgs.lib.mkBefore (builtins.readFile ./qtconf/qt5ct.conf);
      ".config/qt6ct/qt6ct.conf".text = pkgs.lib.mkBefore (builtins.readFile ./qtconf/qt6ct.conf);
    };
  };
}
