{
  userSettings,
  systemSettings,
  ...
}: {
  home = {
    username = userSettings.user.username;
    homeDirectory = "/home/" + userSettings.user.username;
    stateVersion = systemSettings.nix.version;
    sessionVariables = {
      EDITOR = userSettings.environment.editor;
      TERM = userSettings.environment.term;
      BROWSER = userSettings.environment.browser;
    };
  };

  programs.home-manager.enable = true;
}
