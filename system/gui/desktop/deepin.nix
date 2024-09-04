{systemSettings, ...}: {
  imports = [
    ../server/x11.nix
    ../display/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.deepin.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
}
