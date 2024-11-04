{
  # Depencency services
  system.services = {
    xorg.enable = true;
    displaymanager.lightdm.enable = true;
  };

  # Enable Cinnamon desktop environment
  services.xserver = {
    desktopManager.cinnamon.enable = true;
  };
  services.cinnamon.apps.enable = true;
}
