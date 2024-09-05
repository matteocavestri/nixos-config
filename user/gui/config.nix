{
  userSettings,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../style/stylix.nix
  ];

  home = {
    packages = with pkgs; [
      pamixer
      pavucontrol
      playerctl
    ];
    sessionVariables = {
      XCURSOR_THEME = config.gtk.cursorTheme.name;
      XCURSOR_SIZE = builtins.toString config.gtk.cursorTheme.size;
      EDITOR = userSettings.environment.editor;
      TERM = userSettings.environment.term;
      BROWSER = userSettings.environment.browser;
    };
  };

  fonts.fontconfig.defaultFonts = {
    monospace = [userSettings.appearance.font];
    sansSerif = [userSettings.appearance.font];
    serif = [userSettings.appearance.font];
  };
}
