{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../config.nix
    ./extensions/blurmyshell.nix
    ./extensions/dashtodock.nix
  ];
  home = {
    packages = with pkgs; [
      gnome.gnome-tweaks
      gnomeExtensions.user-themes
    ];
    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_BACKEND = "wayland";
      NIXOS_OZONE_WL = "1";
      GDK_BACKEND = "wayland,x11,*";
      QT_QPA_PLATFORM = "wayland;xcb";
    };
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.user-themes.extensionUuid
        ];
        favourite-apps = [
          "firefox.desktop"
          "thunderbird.desktop"
          "kitty.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Calendar.desktop"
          "startcenter.desktop"
          "neovide.desktop"
          "org.gnome.Settings.desktop"
        ];
      };
      "org/gnome/desktop/interface" = {
        clock-format = "24h";
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file://" + config.stylix.image;
        picture-uri-dark = "file://" + config.stylix.image;
      };
    };
  };
}
