{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    gamemode
    mangohud
  ];
  programs.mangohud.enable = true;
}
