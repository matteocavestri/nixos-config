{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    gamemode 
    steam
    gamescope
  ];
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };
}
