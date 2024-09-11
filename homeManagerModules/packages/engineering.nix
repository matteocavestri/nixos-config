{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    user.packages = {
      freecad.enable = lib.mkEnableOption "Install Freecad and physics simulators";
      kicad.enable = lib.mkEnableOption "Install KiCad";
      numbat.enable = lib.mkEnableOption "Install Numbat";
      octave.enable = lib.mkEnableOption "Install Octave";
    };
  };

  config = {
    home.packages = with pkgs;
      lib.optionals config.user.packages.freecad.enable [
        freecad
        calculix
        elmerfem
        gmsh
        paraview
      ]
      ++ (lib.optionals config.user.packages.kicad.enable [
        kicad-small
      ])
      ++ (lib.optionals config.user.packages.numbat.enable [
        numbat
      ])
      ++ (lib.optionals config.user.packages.octave.enable [
        octaveFull
        octavePackages.ocl
        octavePackages.linear-algebra
        octavePackages.statistics
        octavePackages.signal
      ]);
  };
}
