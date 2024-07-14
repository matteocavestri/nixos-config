{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.nevica.packages.${pkgs.system}.default
    pkgs.clippy
    pkgs.rustfmt
    pkgs.rust-analyzer
    pkgs.lldb_18
    pkgs.gdb
  ];
}
