{ pkgs, config, lib, ... }:

  
{
  programs.rofi = {
    enable = true;
    location = "center";
    pass = { };
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
      pkgs.rofi-systemd
    ];
    extraConfig = {
      modi = "combi,drun,run,ssh";
    };
   };

  home.packages = with pkgs; [
    jq # Reqired for rofi-systemd
  ];
}
