{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    gnumake
    cmake
    gdb
  ];
}
