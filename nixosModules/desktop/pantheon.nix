{
  # Dependency services
  system.services = {
    xorg.enable = true;
    displayManager.lightdm.enable = true;
  };

  # Enable Pantheon desktop environment and apps
  services = {
    xserver = {
      desktopManager.pantheon.enable = true;
    };
    pantheon.apps.enable = true;
  };
}
