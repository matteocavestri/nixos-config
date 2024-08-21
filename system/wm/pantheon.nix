{...}: {
  imports = [
    ./servers/x11.nix
    ./displaymanager/lightdm.nix
  ];
  services = {
    xserver = {
      enable = true;
      desktopManager.pantheon.enable = true;
    };
    pantheon.apps.enable = true;
  };
}
