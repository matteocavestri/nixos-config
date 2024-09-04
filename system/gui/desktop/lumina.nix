{systemSettings, ...}: {
  imports = [
    ../server/x11.nix
    ../display/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.lumina.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
}
