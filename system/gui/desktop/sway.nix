{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../server/wayland.nix
    ../display/sddm.nix
    ../../../nixosModules/security/desktop.nix
  ];

  system.security.polkit.enable = lib.mkForce true;

  programs.sway = {
    enable = true;
    package = pkgs.sway;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
  };
}
