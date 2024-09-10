{
  # Dependency services
  system.services = {
    xorg.enable = true;
    displayManager.lightdm.enable = true;
  };

  # Enable Lumina desktop environment
  services.xserver = {
    desktopManager.lumina.enable = true;
  };
}
