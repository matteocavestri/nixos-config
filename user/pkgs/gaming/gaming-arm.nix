{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    prismlauncher
    gamemode
    mangohud
  ];
}
