{pkgs, ...}:{
  imports = [
    ../config.nix
  ];
  home.packages = [
    pkgs.xclip
    pkgs.gnome.gnome-calendar
  ];
}
