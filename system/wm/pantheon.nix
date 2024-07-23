{...}: {
  imports = [
    ./x11.nix
  ];
  services.xserver.desktopManager.pantheon.enable = true;
  services.pantheon.apps.enable = true;
}
