# TODO: Move home-manager from standalone Install to nixos modules
{
  userSettings,
  systemSettings,
  lib,
  config,
  ...
}: {
  options = {
    user.config.homemanager.enable = lib.mkEnableOption "Enable Home Manager";
  };

  config = lib.mkIf config.user.config.homemanager.enable {
    home = {
      # Configure Home Manager, home directory and ssession Variables
      inherit (userSettings.user) username;
      homeDirectory = "/home/" + userSettings.user.username;
      stateVersion = systemSettings.nix.version;
      sessionVariables = {
        EDITOR = userSettings.environment.editor;
        TERM = userSettings.environment.term;
        BROWSER = userSettings.environment.browser;
      };
    };

    # Install Home Manager bin
    programs.home-manager.enable = true;
  };
}
