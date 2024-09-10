{
  lib,
  pkgs,
  ...
}: {
  system = {
    security.polkit.enable = lib.mkForce true;
    services = {
      wayland.enable = true;
      displaymanager.sddm.enable = true;
    };
  };

  programs.sway = {
    enable = true;
    package = pkgs.sway;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
  };
}
