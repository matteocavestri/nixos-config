{
  userSettings,
  pkgs,
  lib,
  ...
}: {
  gtk = {
    enable = true;
    cursorTheme = {
      package = userSettings.appearance.cursorPkg;
      name = userSettings.appearance.cursor;
      size = 24;
    };
    theme = {
      name = lib.mkForce "adw-gtk3-dark";
      package = lib.mkForce pkgs.adw-gtk3;
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
        gtk-theme = "adw-gtk3-dark";
      };
    };
  };
}
