{userSettings, ...}: {
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
