{systemSettings, ...}: {
  imports = [
    ./servers/x11.nix
    ./displaymanager/lightdm.nix
  ];
  services.xserver = {
    enable = true;
    desktopManager.lumina.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
}
