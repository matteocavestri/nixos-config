{userSettings, ...}: {
  gtk = {
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
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "adw-gtk3";
      };
    };
  };
}
