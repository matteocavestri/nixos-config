{
  userSettings,
  systemSettings,
  ...
}: {
  home = {
    username = userSettings.username;
    homeDirectory = "/home/" + userSettings.username;
    stateVersion = systemSettings.version;
    sessionVariables = {
      EDITOR = userSettings.editor;
      TERM = userSettings.term;
      BROWSER = userSettings.browser;
    };
  };

  programs.home-manager.enable = true;
}
