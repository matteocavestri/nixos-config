{systemSettings, ...}: {
  imports = [
    ./servers/x11.nix
    ./displaymanager/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.mate.enable = true;
    xkb.layout = systemSettings.keymap;
  };
}
