{systemSettings, ...}: {
  imports = [
    ../server/x11.nix
    ../display/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.budgie.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
}
