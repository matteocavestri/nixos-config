{systemSettings, ...}: {
  imports = [
    ./x11.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
    xkb.layout = systemSettings.keymap;
  };
  services.cinnamon.apps.enable = true;
}
