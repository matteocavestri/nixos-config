{...}: {
  imports = [
    ../server/x11.nix
    ../display/lightdm.nix
  ];
  services = {
    xserver = {
      enable = true;
      desktopManager.pantheon.enable = true;
    };
    pantheon.apps.enable = true;
  };
}
