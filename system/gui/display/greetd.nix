{
  pkgs,
  userSettings,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # TODO: pass variables
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "${userSettings.user.username}";
      };
    };
  };
}
