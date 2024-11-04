{
  config,
  types,
  lib,
  ...
}: {
  options = {
    # Default Username ( You can override it from custom )
    neve.config.username = lib.mkOption {
      type = types.str;
      default = "neve";
    };
  };

  # Main user configuration
  config = {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${config.neve.config.username} = {
      isNormalUser = true;
      extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
      packages = [];
    };
  };
}
