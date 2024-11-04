{
  # Dependency services
  system.services = {
    xorg.enable = true;
    displaymanager.lightdm.enable = true;
  };

  # Enable Mate desktop environment
  services.xserver = {
    desktopManager.mate.enable = true;
  };
}
