{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.nevica.packages.${pkgs.system}.nevica-full
    pkgs.clippy
    pkgs.rustfmt
    pkgs.lldb_18
    pkgs.neovide
  ];
}
