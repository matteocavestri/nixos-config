{...}: {
  imports = [
    ../display/lightdm.nix
  ];
  system.services.xorg.enable = true;
  services = {
    xserver = {
      enable = true;
      desktopManager.pantheon.enable = true;
    };
    pantheon.apps.enable = true;
  };
}
