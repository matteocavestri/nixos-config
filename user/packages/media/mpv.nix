{pkgs, ...}: {
  home.packages = with pkgs; [
    mpv
    delfin
    cava
  ];
}
