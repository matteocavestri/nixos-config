{pkgs, ...}: {
  home.packages = with pkgs; [
    numbat
  ];
}
