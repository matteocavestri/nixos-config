{
  # Dependency sservices
  system.services = {
    xorg.enable = true;
    displaymanager.lightdm.enable = true;
  };

  # Enable Deepin desktop environment
  services.xserver = {
    desktopManager.deepin.enable = true;
  };
}
