{pkgs, ...}: {
  imports = [
    ../config.nix
    ./extensions/blurmyshell.nix
    ./extensions/dashtodock.nix
  ];

  user.services.qtstyle.enable = true;

  home = {
    packages = with pkgs; [
      (
        if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
        then gnome.gnome-tweaks
        else gnome-tweaks
      )
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
        favorite-apps = [
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Geary.desktop"
          "org.gnome.Calendar.desktop"
          "org.gnome.World.Iotas.desktop"
          "org.gnome.Todo.desktop"
          "startcenter.desktop"
          "kitty.desktop"
          "org.gnome.Software.desktop"
          "org.gnome.Settings.desktop"
        ];
      };
      "org/gnome/desktop/interface" = {
        clock-format = "24h";
        clock-show-weekday = true;
      };
      "org/gnome/mutter" = {
        experimental-features = ["scale-monitor-framebuffer"];
      };
    };
  };
}
