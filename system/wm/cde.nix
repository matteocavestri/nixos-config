{systemSettings, ...}: {
  imports = [
    ./servers/x11.nix
    ./displaymanager/lightdm.nix
  ];
  services.xserver = {
    desktopManager.cde = {
      enable = true;
      extraPackages = [];
    };
    xkb.layout = systemSettings.keymap;
  };
}
