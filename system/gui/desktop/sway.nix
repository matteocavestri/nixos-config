{pkgs, ...}: {
  imports = [
    ../server/wayland.nix
    ../display/sddm.nix
    ../../security/polkit.nix
  ];
  programs.sway = {
    enable = true;
    package = pkgs.sway;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
  };
}
