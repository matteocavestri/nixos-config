{ pkgs, ... }:

{
  # Feral GameMode
  environment.systemPackages = with pkgs; [ 
    gamemode 
    steam
    prismlauncher
    gamescope
    mangohud
  ];
  programs.gamemode.enable = true;
  programs.steam.enable = true;
}
