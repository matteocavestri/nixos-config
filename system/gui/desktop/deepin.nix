{systemSettings, ...}: {
  system.services = {
    xorg.enable = true;
    displayManager.lightdm.enable = true;
  };
  services.xserver = {
    enable = true;
    desktopManager.deepin.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
}
