{systemSettings, ...}: {
  system.services = {
    xorg.enable = true;
    displayManager.lightdm.enable = true;
  };
  services.xserver = {
    desktopManager.cde = {
      enable = true;
      extraPackages = [];
    };
    xkb.layout = systemSettings.host.keymap;
  };
}
