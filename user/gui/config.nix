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
      glib
      gnome.gnome-calendar
      gnome.nautilus
      gnome.gnome-calculator
      gnome-connections
      endeavour
      iotas
      evince
      mission-center
      gnome.gnome-music
      tracker
      tracker-miners
      snapshot
      baobab
      loupe
      gnome.gnome-font-viewer
      gnome-text-editor
      gnome.gnome-maps
      gnome.file-roller
      gnome.gnome-contacts
      gnome-online-accounts-gtk
      gnome.gnome-disk-utility
      gnome.gnome-weather
      gnome.gnome-clocks
      gnome.geary
      vlc
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
