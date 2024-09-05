{pkgs, ...}: {
  home.packages = with pkgs; [
    kicad-small
  ];
}
