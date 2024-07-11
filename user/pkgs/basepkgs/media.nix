{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    kdenlive
    inkscape
    obs-studio
    ardour
    mpv
    delfin
    vlc
  ];
}
