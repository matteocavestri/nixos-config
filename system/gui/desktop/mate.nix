{systemSettings, ...}: {
  imports = [
    ../server/x11.nix
    ../display/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.mate.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
}
