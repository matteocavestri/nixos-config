{systemSettings, ...}: {
  system.services = {
    xorg.enable = true;
    displayManager.lightdm.enable = true;
  };
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
  services.cinnamon.apps.enable = true;
}
