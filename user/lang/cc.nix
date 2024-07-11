{ pkgs, ... }:

{
  home.packages = with pkgs; [
      gcc
      gnumake
      cmake
      autoconf
      automake
      libtool
      cmake
      gnupatch
      clang-tools
  ];
}
