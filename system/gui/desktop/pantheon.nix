{
  system.services = {
    xorg.enable = true;
    displayManager.lightdm.enable = true;
  };
  services = {
    xserver = {
      enable = true;
      desktopManager.pantheon.enable = true;
    };
    pantheon.apps.enable = true;
  };
}
