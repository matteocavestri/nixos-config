{pkgs, ...}: {
  home.packages = with pkgs; [
    freecad
    calculix
    octaveFull
    kicad
    paraview
  ];
}
