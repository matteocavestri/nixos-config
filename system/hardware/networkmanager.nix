{
  systemSettings,
  userSettings,
  ...
}: {
  # Networking Configuration
  networking = {
    hostName = systemSettings.host.hostname;
    networkmanager.enable = true; # Easiest to use and most distros use this by default.
    firewall.checkReversePath = false;
  };
  users.users.${userSettings.user.username}.extraGroups = ["networkmanager"];
}
