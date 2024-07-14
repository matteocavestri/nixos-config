{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  # Networking Configuration
  networking.hostName = systemSettings.hostname;
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  users.users.${userSettings.username}.extraGroups = ["networkmanager"];
}
