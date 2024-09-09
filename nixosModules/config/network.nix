{
  lib,
  config,
  systemSettings,
  userSettings,
  ...
}: {
  options = {
    system.config = {
      network = {
        enable = lib.mkEnableOption "Enable Networking";
        wgsupport = lib.mkEnableOption "Enable WireGuard support";
      };
      wifi = {
        wpasupplicant = lib.mkEnableOption "Use wpa_supplicant as backend";
        iwd = lib.mkEnableOption "Use iwd as backend";
      };
      bluetooth.enable = lib.mkEnableOption "Enable Bluetooth connectivity";
    };
  };

  config = {
    # Network Manager configuration
    users.users.${userSettings.user.username}.extraGroups = lib.mkIf config.system.config.network.enable ["networkmanager"];
    networking = lib.mkIf config.system.config.network.enable {
      hostName = systemSettings.host.hostname;
      networkmanager = {
        enable = true;
        # Setup wifi backend (iwd, wpa_supplicant or null)
        wifi.backend =
          lib.mkIf config.system.config.wifi.iwd "iwd"
          // lib.mkIf config.system.config.wifi.wpasupplicant "wpa_supplicant"
          // "wpa_supplicant";
      };

      # iwd wifi backend
      wireless.iwd = lib.mkIf config.system.config.wifi.iwd {
        enable = true;
        settings.General.EnableNetworkConfiguration = true;
      };

      # Wireguard Support by disabling checkReversePath
      firewall.checkReversePath = lib.mkIf config.system.config.network.wgsupport false;
    };

    # Bluetooth Support
    hardware.bluetooth = lib.mkIf config.system.config.bluetooth.enable {
      enable = true;
      powerOnBoot = true;
    };
  };
}
