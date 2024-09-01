{
  systemSettings,
  userSettings,
  ...
}: {
  # Networking Configuration
  networking = {
    hostName = systemSettings.hostname;
    networkmanager = {
      enable = true; # Easiest to use and most distros use this by default.
      wifi.backend = "wpa_supplicant";
    };
    firewall.checkReversePath = false;
  };
  users.users.${userSettings.username}.extraGroups = ["networkmanager"];
}
