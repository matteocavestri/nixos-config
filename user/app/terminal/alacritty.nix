{ pkgs, home-manager, ... }:

{
  home.packages = [ pkgs.alacritty ];

  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    live_config_reload = true;

    shell = {
      program = "zsh";
      args = ["-l"];
    };

    env = {
      TERM = "xterm-256color";
    };

    keyboard = {
      bindings = [
        {
          key = "N";
          mods = "Control|Shift";
          action = "CreateNewWindow";
        }
        {
          key = "F11";
          mods = "None";
          action = "ToggleFullscreen";
        }
      ];
    };

    font = {
      normal = {
        family = "Inconsolata Nerd Font";
        style = "Regular";
      };
      bold = {
        family = "Inconsolata Nerd Font";
        style = "Bold";
      };
      italic = {
        family = "Inconsolata Nerd Font";
        style = "Italic";
      };
      bold_italic = {
        family = "Inconsolata Nerd Font";
        style = "Bold Italic";
      };
      size = 12.0;
      builtin_box_drawing = true;
    };

    colors = {
      draw_bold_text_with_bright_colors = true;
    };

    window = {
      opacity = 1.0;
      padding = {
        x = 5;
        y = 5;
      };
      decorations = "Full"; # Full, Buttonless, Transparent, None
      dynamic_padding = true;
    };
  };
}

