{systemSettings, ...}: {
  imports = [
    ../server/x11.nix
    ../display/lightdm.nix
  ];
  services.xserver = {
    desktopManager.cde = {
      enable = true;
      extraPackages = [];
    };
    xkb.layout = systemSettings.host.keymap;
  };
}
