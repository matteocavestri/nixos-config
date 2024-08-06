{
  systemSettings,
  userSettings,
  ...
}: {
  networking.hostName = systemSettings.hostname; # Define your hostname.
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };
}
