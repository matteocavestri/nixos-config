{
  userSettings,
  config,
  ...
}: {
  gtk.cursorTheme = {
    package = userSettings.cursorPkg;
    name = userSettings.cursor;
    size = 24;
  };

  gtk.iconTheme = {
    package = userSettings.iconsPkg;
    name = userSettings.icons;
  };

  home.sessionVariables = {
    XCURSOR_THEME = config.gtk.cursorTheme.name;
    XCURSOR_SIZE = builtins.toString config.gtk.cursorTheme.size;
    EDITOR = userSettings.editor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };
}
