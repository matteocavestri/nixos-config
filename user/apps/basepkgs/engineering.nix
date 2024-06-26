{ pkgs, ... }:

{
  home.packages = with pkgs; [
    freecad
    octave
  ];
}
