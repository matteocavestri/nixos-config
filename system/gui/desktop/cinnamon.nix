{systemSettings, ...}: {
  imports = [
    ../display/lightdm.nix
  ];
  system.services.xorg.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
  services.cinnamon.apps.enable = true;
}
