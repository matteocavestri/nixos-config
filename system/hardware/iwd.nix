{
  systemSettings,
  userSettings,
  ...
}: {
  networking = {
    hostName = systemSettings.hostname; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
    firewall.checkReversePath = false;
  };
  users.users.${userSettings.username}.extraGroups = ["networkmanager"];
}
