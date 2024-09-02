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
}
