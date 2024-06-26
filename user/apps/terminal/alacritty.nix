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

    mouse = {
      hide_when_typing = false;
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
            
      primary = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        dim_foreground = "#CDD6F4";
        bright_foreground = "#CDD6F4";
      };

      cursor = {
        text = "#1E1E2E";
        cursor = "#F5E0DC";
      };

      vi_mode_cursor = {
        text = "#1E1E2E";
        cursor = "#B4BEFE";
      };

      search = {
        matches = {
          foreground = "#1E1E2E";
          background = "#A6ADC8";
        };
        focused_match = {
          foreground = "#1E1E2E";
          background = "#A6E3A1";
        };
      };

      footer_bar = {
        foreground = "#1E1E2E";
        background = "#A6ADC8";
      };

      hints = {
        start = {
          foreground = "#1E1E2E";
          background = "#F9E2AF";
        };
        end = {
          foreground = "#1E1E2E";
          background = "#A6ADC8";
        };
      };

      selection = {
        text = "#1E1E2E";
        background = "#F5E0DC";
      };

      normal = {
        black = "#45475A";
        red = "#F38BA8";
        green = "#A6E3A1";
        yellow = "#F9E2AF";
        blue = "#89B4FA";
        magenta = "#F5C2E7";
        cyan = "#94E2D5";
        white = "#BAC2DE";
      };

      bright = {
        black = "#585B70";
        red = "#F38BA8";
        green = "#A6E3A1";
        yellow = "#F9E2AF";
        blue = "#89B4FA";
        magenta = "#F5C2E7";
        cyan = "#94E2D5";
        white = "#A6ADC8";
      };

      dim = {
        black = "#45475A";
        red = "#F38BA8";
        green = "#A6E3A1";
        yellow = "#F9E2AF";
        blue = "#89B4FA";
        magenta = "#F5C2E7";
        cyan = "#94E2D5";
        white = "#BAC2DE";
      };

      indexed_colors = [
        {
          index = 16;
          color = "#FAB387";
        }
        {
          index = 17;
          color = "#F5E0DC";
        }
      ];
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

