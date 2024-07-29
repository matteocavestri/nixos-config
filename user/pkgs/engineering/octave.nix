{pkgs, ...}: {
  home.packages = with pkgs; [
    octaveFull
    octavePackages.ocl
    octavePackages.linear-algebra
    octavePackages.statistics
    octavePackages.signal
  ];
}
