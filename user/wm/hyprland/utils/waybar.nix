{ config, pkgs, lib, userSettings, ... }:

with lib;
{ 
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        layer = "top"; # Waybar at top layer
        position = "top"; # Waybar position (top|bottom|left|right)
        height = 30; # Waybar height (to be removed for auto height)
        margin = "7 7 3 7";
        spacing = 2;
        # width = 1280; # Waybar width
        # spacing = 4; # Gaps between modules (4px)

        # Choose the order of the modules
        modules-left = [ "custom/os" "cpu" "memory" "battery" "pulseaudio" "backlight" ];
        modules-center = [ "idle_inhibitor" "hyprland/workspaces" ];
        modules-right = [ "tray" "clock" "custom/power" ];
        #modules-left = [ "hyprland/workspaces" "sway/mode" "sway/scratchpad" "custom/media" ];
        #modules-center = [ "hyprland/window" ];
        #modules-right = [ "mpd" "idle_inhibitor" "temperature" "cpu" "memory"   "keyboard-state"  "battery#bat2"   ];

        # Modules configuration
        "custom/power" = {
          format = "⏻";
          tooltip = false;
          on-click = "wlogout -p layer-shell";
        };

        "hyprland/window" = {
           format = "| {}";
           rewrite = {
             "(.*) — Mozilla Firefox" = "🌐 $1";
             "(.*) - zsh" = "> [$1]";
           };
           separate-outputs = true;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            #"1" = "";
            #"2" = "";
            #"3" = "";
            #"4" = "";
            #"5" = "";
            "1" = "󱚌";
            "2" = "󰖟";
            "3" = "";
            "4" = "󰎄";
            "5" = "󰋩";
            "6" = "";
            "7" = "󰄖";
            "8" = "󰑴";
            "9" = "󱎓";
            active = "";
            default = "";
          };
          ignore-workspaces = ["scratch" "-"];
          persistent-workspaces = {
            "*" = 9;
          };
          "on-click" = "activate";
          #"on-scroll-up" = "hyprctl dispatch workspace e+1";
          #"on-scroll-down" = "hyprctl dispatch workspace e-1";
        };

        "custom/os" = {
          format = " {} ";
          exec = ''echo "" '';
          interval = "once";
          on-click = "fuzzel";
        };

        "custom/spacer" = {
          format = "{}";
          exec = ''echo "|"'';
          interval = "once";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        cpu = {
          "format" = "{usage}% ";
        };

        memory = { "format" = "{}% "; };

        "tray" = {
          spacing = 10;
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          #format = "{:L%d-%m-%Y <small>[%a]</small> <tt><small>%p</small></tt>%H:%M}";
          #format = "{:%a %d-%m-%Y %H:%M}";
          format = "{:%a %d:%m:%Y %H:%M}";
          on-click = "gnome-calendar";
        };

        "backlight" = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        battery = {
          states = {
            good = 60;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-icons = [ "" "" "" "" "" ];
        };

        "pulseaudio" = {
          scroll-step = 1; # %, can be a float
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}%  {icon}";
          format-bluetooth-muted = "  {icon}";
          #format-muted = "  {format_source}";
          #format-source = " {volume}%";
          #format-source-muted = "";
          format-icons = {
            default = ["" "" ""];
          };
          "on-click" = "pavucontrol";
        };
      };
    };
    style = ''
        * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: FontAwsome, ''+userSettings.font+'';
        font-size: 16px;
        /*border-radius: 8;*/
      }

      window#waybar {
        background: transparent;
        background-color: rgba('' + config.lib.stylix.colors.base00-rgb-r + "," + config.lib.stylix.colors.base00-rgb-g + "," + config.lib.stylix.colors.base00-rgb-b + "," + ''0.55);
        color: #'' + config.lib.stylix.colors.base07 + '';
        transition-property: background-color;
        transition-duration: .5s;
        /*border-radius: 8px;*/
      }

      tooltip {
        color: #'' + config.lib.stylix.colors.base07 + '';
        background-color: rgba('' + config.lib.stylix.colors.base00-rgb-r + "," + config.lib.stylix.colors.base00-rgb-g + "," + config.lib.stylix.colors.base00-rgb-b + "," + ''0.9);
        border-style: solid;
        border-width: 3px;
        border-radius: 8px;
        border-color: #'' + config.lib.stylix.colors.base08 + '';
      }

      tooltip * {
        color: #'' + config.lib.stylix.colors.base07 + '';
        background-color: rgba('' + config.lib.stylix.colors.base00-rgb-r + "," + config.lib.stylix.colors.base00-rgb-g + "," + config.lib.stylix.colors.base00-rgb-b + "," + ''0.0);
      }

      window > box {
          opacity: 0.94;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      button {
          border: none;
      }

      button:hover {
          background: inherit;
      }

      #workspaces button {
          padding: 0 7px;
          background-color: transparent;
          color: #'' + config.lib.stylix.colors.base04 + '';
      }

      #workspaces button:hover {
          color: #'' + config.lib.stylix.colors.base07 + '';
      }

      #workspaces button.active {
          color: #'' + config.lib.stylix.colors.base08 + '';
      }

      #workspaces button.focused {
          color: #'' + config.lib.stylix.colors.base0A + '';
      }

      #workspaces button.visible {
          color: #'' + config.lib.stylix.colors.base05 + '';
      }

      #workspaces button.urgent {
          color: #'' + config.lib.stylix.colors.base09 + '';
      }

      #battery,
      #cpu,
      #memory,
      #backlight,
      #pulseaudio,
      #clock,
      #tray,
      #idle_inhibitor,
      #custom-power,
      #workspaces {
          color: #'' + config.lib.stylix.colors.base07 + '';
          padding: 0 10px;
          border: none;
          border-radius: 8px;
      }

      .modules-right {
        border-radius: 8px;
      }

      .modules-left {
        border-radius: 8px;
      }     

      #cpu {
          color: #'' + config.lib.stylix.colors.base0D + '';
      }

      #memory {
          color: #'' + config.lib.stylix.colors.base0E + '';
      }

      #battery {
          color: #'' + config.lib.stylix.colors.base0B + '';
      }

      #battery.charging, #battery.plugged {
          color: #'' + config.lib.stylix.colors.base0C + '';
      }

      @keyframes blink {
          to {
              background-color: #'' + config.lib.stylix.colors.base07 + '';
              color: #'' + config.lib.stylix.colors.base00 + '';
          }
      }

      #battery.critical:not(.charging) {
          background-color: #'' + config.lib.stylix.colors.base08 + '';
          color: #'' + config.lib.stylix.colors.base07 + '';
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      label:focus {
          background-color: #'' + config.lib.stylix.colors.base00 + '';
      }

      #pulseaudio {
          color: #'' + config.lib.stylix.colors.base0C + '';
      }

      #pulseaudio.muted {
          color: #'' + config.lib.stylix.colors.base04 + '';
      }

      #backlight {
          color: #'' + config.lib.stylix.colors.base0A + '';
      }

      #idle_inhibitor {
          color: #'' + config.lib.stylix.colors.base04 + '';
      }

      #idle_inhibitor.activated {
          color: #'' + config.lib.stylix.colors.base0F + '';
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
      }

      #clock {
          color: #'' + config.lib.stylix.colors.base0D + '';
      }

      #custom-power {
          color: #'' + config.lib.stylix.colors.base0E + '';
      }
    '';
  };
}
