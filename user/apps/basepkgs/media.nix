{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    krita
    kdenlive
    inkscape
    obs-studio
    ardour
    mpv
  ];
}
