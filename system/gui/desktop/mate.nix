{systemSettings, ...}: {
  imports = [
    ../display/lightdm.nix
  ];
  system.services.xorg.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.mate.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
}
