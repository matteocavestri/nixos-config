{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    krita
    kdenlive
    glaxnimate
    inkscape
    obs-studio
    ardour
    mpv
    delfin
  ];
}
