{
  lib,
  pkgs,
  ...
}: {
  # Dependency services
  system = {
    security.polkit.enable = lib.mkForce true;
    services = {
      wayland.enable = true;
      displaymanager.sddm.enable = true;
    };
  };

  # Enable Sway Window manager
  programs.sway = {
    enable = true;
    package = pkgs.sway;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
  };
}
