{ pkgs, ... }:

{
  home.packages = with pkgs; [
      cargo # Downloads your Rust project's dependencies and builds your project
      rustc # Compiler for rust
  ];
}
