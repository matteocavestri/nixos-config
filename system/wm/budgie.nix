{systemSettings, ...}: {
  imports = [
    ./servers/x11.nix
    ./displaymanager/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.budgie.enable = true;
    xkb.layout = systemSettings.keymap;
  };
}
