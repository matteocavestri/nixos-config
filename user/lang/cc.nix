{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # CC
      gcc
      gnumake
      cmake
      autoconf
      automake
      libtool
      cmake
      gnupatch
      # astyle
      # cpplint
      clang-tools


      libGLU
  ];
}
