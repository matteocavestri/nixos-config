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
}
