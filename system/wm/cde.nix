{pkgs, ...}: {
  imports = [
    ./x11.nix
  ];
  services.xserver.desktopManager.cde.enable = true;
  services.xserver.desktopManager.cde.extraPackages = with pkgs; [
  ];
}
