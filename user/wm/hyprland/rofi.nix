{ pkgs, config, lib, ... }:

{
  programs.rofi = {
    enable = true;
    font = "Incosolata Nerd Font";
    package = pkgs.rofi.override { plugins = 
      [ 
        pkgs.rofi-emoji 
        pkgs.rofi-calc
        pkgs.rofi-systemd
      ]; 
    };
    location = "center";
    cycle = true;
    xoffset = 0;
    yoffset = -20;
    theme = "arthur"; 
    extraConfig = {
      modi = "combi,drun,run,ssh,emoji,calc";
      show-icons = true;
      sort = true;
    };
   };

  home.packages = with pkgs; [
    jq # Reqired for rofi-systemd
  ];
}
