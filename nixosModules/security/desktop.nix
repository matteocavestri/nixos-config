{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.security = {
      # pam.enable = lib.mkEnableOption "Enable pam security";
      gnome-keyring.enable = lib.mkEnableOption "Enable gnome-keyring service";
      polkit.enable = lib.mkEnableOption "Enable polkit systemd service";
    };
  };

  config = {
    security = {
      # Enable pam support for gnome-keyring
      pam = {
        services = {
          login.enableGnomeKeyring = lib.mkIf config.system.security.gnome-keyring.enable true;
        };
      };
    };

    # Enable Gnome keyring service
    services = lib.mkIf config.system.security.gnome-keyring.enable {
      gnome = {
        gnome-keyring.enable = true;
      };
    };

    # Enable polkit and systemd polkit service (using polkit_gnome)
    security.polkit.enable = lib.mkIf config.system.security.polkit.enable true;
    systemd = lib.mkIf config.system.security.polkit.enable {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = ["graphical-session.target"];
        wants = ["graphical-session.target"];
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };
}
