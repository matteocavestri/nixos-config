{systemSettings, ...}: {
  imports = [
    ./servers/x11.nix
    ./displaymanager/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
    xkb.layout = systemSettings.keymap;
  };
  services.cinnamon.apps.enable = true;
}
