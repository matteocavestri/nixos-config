{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.services = {
      dbus.enable = lib.mkEnableOption "Enable Dbus configuration";
      dconf.enable = lib.mkEnableOption "Enable dconf configuration";
      gvfs.enable = lib.mkEnableOption "Enable gvfs";
      online-accounts.enable = lib.mkEnableOption "Enable online-accounts (Gnome Online Accounts backend)";
    };
  };

  config = {
    services = {
      # Dbus configuration
      dbus = lib.mkIf config.system.services.dbus.enable {
        enable = true;
        packages = [pkgs.dbus];
      };

      # gvfs configuration
      gvfs.enable = lib.mkIf config.system.services.gvfs.enable true;

      # Online account activations
      gnome = lib.mkIf config.system.services.online-accounts.enable {
        gnome-online-accounts.enable = true;
        gnome-online-miners.enable = true;
      };
    };

    # Dconf configuration
    programs.dconf = lib.mkIf config.system.services.dconf.enable {
      enable = true;
    };
  };
}
