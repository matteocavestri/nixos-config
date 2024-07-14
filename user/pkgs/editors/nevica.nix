{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.nevica.packages.${pkgs.system}.default
    pkgs.clippy
    pkgs.rustfmt
    pkgs.lldb_18
  ];
}
