{systemSettings, ...}: {
  imports = [
    ../display/lightdm.nix
  ];
  system.services.xorg.enable = true;
  services.xserver = {
    desktopManager.cde = {
      enable = true;
      extraPackages = [];
    };
    xkb.layout = systemSettings.host.keymap;
  };
}
