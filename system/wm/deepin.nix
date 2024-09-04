{systemSettings, ...}: {
  imports = [
    ./servers/x11.nix
    ./displaymanager/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.deepin.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
}
