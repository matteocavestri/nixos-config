{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.nevica.packages.${pkgs.system}.nevica-full
    pkgs.neovide
  ];
}
