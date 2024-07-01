{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.neve.packages.${pkgs.system}.default
    pkgs.neovide
    pkgs.nixfmt-classic
    pkgs.statix
  ];
}
