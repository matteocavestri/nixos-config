{
  systemSettings,
  userSettings,
  ...
}: {
  # Networking Configuration
  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    firewall.checkReversePath = false;
  };
  users.users.${userSettings.username}.extraGroups = ["networkmanager"];
}
