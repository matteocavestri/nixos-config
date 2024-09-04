{pkgs, ...}: {
  # TODO: fix cursor.pcf --> see https://github.com/FreeCAD/FreeCAD/issues/10514
  home.packages = with pkgs; [
    freecad
    calculix
    elmerfem
    gmsh
    paraview
  ];
}
