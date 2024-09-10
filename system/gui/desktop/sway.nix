{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../display/sddm.nix
  ];

  system = {
    security.polkit.enable = lib.mkForce true;
    services.wayland.enable = true;
  };

  programs.sway = {
    enable = true;
    package = pkgs.sway;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
  };
}
