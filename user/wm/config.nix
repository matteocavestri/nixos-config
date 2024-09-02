{
  userSettings,
  config,
  ...
}: {
  imports = [
    ../style/stylix.nix
  ];

  home.sessionVariables = {
    XCURSOR_THEME = config.gtk.cursorTheme.name;
    XCURSOR_SIZE = builtins.toString config.gtk.cursorTheme.size;
    EDITOR = userSettings.editor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };

  fonts.fontconfig.defaultFonts = {
    monospace = [userSettings.font];
    sansSerif = [userSettings.font];
    serif = [userSettings.font];
  };
}
