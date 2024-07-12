{ userSettings, ... }:

{
  gtk.cursorTheme = {
    package = userSettings.cursorPkg; 
    name = userSettings.cursor;
    size = 24;
  };

  gtk.iconTheme = {
    package = userSettings.iconsPkg;
    name = userSettings.icons;
  };

  xdg = {
    enable = true;
    mimeApps = {
      defaultApplications = {
        "image/jpeg" = "eog.desktop";
        "image/png" = "eog.desktop";
        "image/gif" = "eog.desktop";
        "image/bmp" = "eog.desktop";
        "image/tiff" = "eog.desktop";
      };
    };
  };
  
  #services.mpd = {
  #  enable = true;
  #};
}
