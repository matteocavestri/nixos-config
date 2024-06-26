{ pkgs, config, lib,... }:

let 
    inherit (config.lib.formats.rasi) mkLiteral;
    rofi-theme = {
      "*" = {
        background-color = mkLiteral "00ff00";
      };
    };
in {
  programs.rofi = {
    enable = true;
    location = "center";
    theme = rofi-theme;
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
