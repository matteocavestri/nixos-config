{
  pkgs,
  lib,
  config,
  userSettings,
  ...
}: {
  home.packages = [pkgs.alacritty];

  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#" + config.lib.stylix.colors.base00;
          foreground = "#" + config.lib.stylix.colors.base07;
        };
        cursor = {
          text = "#" + config.lib.stylix.colors.base00;
          cursor = "#" + config.lib.stylix.colors.base07;
        };
        normal = {
          black = "#" + config.lib.stylix.colors.base00;
          red = "#" + config.lib.stylix.colors.base08;
          green = "#" + config.lib.stylix.colors.base0B;
          yellow = "#" + config.lib.stylix.colors.base0A;
          blue = "#" + config.lib.stylix.colors.base0D;
          magenta = "#" + config.lib.stylix.colors.base0E;
          cyan = "#" + config.lib.stylix.colors.base0B;
          white = "#" + config.lib.stylix.colors.base05;
        };
        bright = {
          black = "#" + config.lib.stylix.colors.base03;
          red = "#" + config.lib.stylix.colors.base09;
          green = "#" + config.lib.stylix.colors.base01;
          yellow = "#" + config.lib.stylix.colors.base02;
          blue = "#" + config.lib.stylix.colors.base04;
          magenta = "#" + config.lib.stylix.colors.base06;
          cyan = "#" + config.lib.stylix.colors.base0F;
          white = "#" + config.lib.stylix.colors.base07;
        };
      };
      font = {
        size = config.stylix.fonts.sizes.terminal;
        normal.family = userSettings.appearance.font;
      };
      window.opacity = lib.mkForce 0.85;
    };
  };
}
