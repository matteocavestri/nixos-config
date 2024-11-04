{
  # Depencency services
  system.services = {
    xorg.enable = true;
    displaymanager.lightdm.enable = true;
  };

  # Common Desktop Environment configuration
  services.xserver = {
    desktopManager.cde = {
      enable = true;
      extraPackages = [];
    };
  };
}
