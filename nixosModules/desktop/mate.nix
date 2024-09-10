{
  # Dependency services
  system.services = {
    xorg.enable = true;
    displayManager.lightdm.enable = true;
  };

  # Enable Mate desktop environment
  services.xserver = {
    desktopManager.mate.enable = true;
  };
}
