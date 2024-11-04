{
  userSettings,
  config,
  lib,
  ...
}: {
  options = {
    system.config.users.enable = lib.mkEnableOption "Enable a user account";
  };

  config = lib.mkIf config.system.config.users.enable {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${userSettings.user.username} = {
      isNormalUser = true;
      extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
      packages = [];
    };
  };
}
