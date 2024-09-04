{systemSettings, ...}: {
  imports = [
    ../server/x11.nix
    ../display/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
  services.cinnamon.apps.enable = true;
}
