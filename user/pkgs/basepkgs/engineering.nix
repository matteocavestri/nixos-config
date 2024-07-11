{ pkgs, ... }:

{
  home.packages = with pkgs; [
    freecad
    octaveFull
    kicad
    paraview
  ];
}
