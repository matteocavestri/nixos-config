{
  systemSettings,
  userSettings,
  ...
}: {
  networking = {
    hostName = systemSettings.host.hostname; # Define your hostname.
    networkmanager = {
      enable = true; # Easiest to use and most distros use this by default.
      wifi.backend = "iwd";
    };
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
    firewall.checkReversePath = false;
  };
  users.users.${userSettings.user.username}.extraGroups = ["networkmanager"];
}
