{
  # Depencency services
  system.services = {
    xorg.enable = true;
    displayManager.lightdm.enable = true;
  };

  # Common Desktop Environment configuration
  services.xserver = {
    desktopManager.cde = {
      enable = true;
      extraPackages = [];
    };
  };
}
