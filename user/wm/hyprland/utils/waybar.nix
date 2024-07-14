{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:
with lib; {
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
        gtk-layer-shell = true;
        mod = "dock";
        # width = 1280; # Waybar width
        # spacing = 4; # Gaps between modules (4px)

        # Choose the order of the modules
        modules-left = ["custom/os" "cpu" "memory" "battery" "mpris"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["tray" "idle_inhibitor" "pulseaudio" "backlight" "clock" "custom/power"];

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
            "1" = "";
            "2" = "";
            "3" = "";
            active = "";
            default = "";
            urgent = "";
          };
          on-click = "activate";
        };

        "custom/os" = {
          format = " {} ";
          exec = ''echo "" '';
          interval = "once";
          on-click = "rofi -show drun";
        };

        "custom/spacer" = {
          format = "{}";
          exec = ''echo "|"'';
          interval = "once";
        };

        mpris = {
          format = " {player_icon} {dynamic}";
          format-paused = " {status_icon} <i>{dynamic}</i>";
          player-icons = {
            "default" = "▶";
            "mpv" = "🎵";
          };
          status-icons = {
            "paused" = "⏸";
          };
          max-length = 30;
          # "ignored-players": ["firefox"]
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        cpu = {
          format = "󰍛 {usage}%";
          format-alt = "{icon0}{icon1}{icon2}{icon3}";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          interval = 3;
        };

        memory = {
          format = "󰾆 {percentage}%";
          format-alt = "󰾅 {used}GB";
          interval = 10;
          max-length = 10;
          tooltip = true;
          tooltip-format = " {used:0.1f}GB/{total:0.1f}GB";
        };

        tray = {
          spacing = 10;
        };

        clock = {
          actions = {
            on-click-right = "mode";
          };
          calendar = {
            format = {
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              months = "<span color='#ffead3'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            };
            mode = "year";
            mode-mon-col = 3;
            on-click-right = "mode";
            on-scroll = 1;
            weeks-pos = "right";
          };
          format = "󰥔 {:%H:%M}";
          format-alt = "󰥔 {:%A, %B %d, %Y (%R)} ";
          tooltip-format = ''
            <span size='9pt' font='Intel One Mono'>{calendar}</span>'';
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        battery = {
          states = {
            good = 60;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "{capacity}%";
          format-plugged = "{capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        pulseaudio = {
          scroll-step = 1; # %, can be a float
          format = "{icon} {volume}%";
          format-bluetooth = " {icon} {volume}%";
          format-bluetooth-muted = "  {icon}";
          format-icons = {
            default = ["" "" ""];
          };
          "on-click" = "pavucontrol";
        };
      };
    };
    style =
      ''
        * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: FontAwsome, ''
      + userSettings.font
      + ''        ;
                font-size: 16px;
                /*border-radius: 8;*/
              }

              window#waybar {
                background: transparent;
                background-color: rgba(''
      + config.lib.stylix.colors.base00-rgb-r
      + ","
      + config.lib.stylix.colors.base00-rgb-g
      + ","
      + config.lib.stylix.colors.base00-rgb-b
      + ","
      + ''        0.55);
                color: #''
      + config.lib.stylix.colors.base07
      + ''        ;
                transition-property: background-color;
                transition-duration: .5s;
                /*border-radius: 8px;*/
              }

              tooltip {
                color: #''
      + config.lib.stylix.colors.base07
      + ''        ;
                background-color: rgba(''
      + config.lib.stylix.colors.base00-rgb-r
      + ","
      + config.lib.stylix.colors.base00-rgb-g
      + ","
      + config.lib.stylix.colors.base00-rgb-b
      + ","
      + ''        0.9);
                border-style: solid;
                border-width: 3px;
                border-radius: 8px;
                border-color: #''
      + config.lib.stylix.colors.base08
      + ''        ;
              }

              tooltip * {
                color: #''
      + config.lib.stylix.colors.base07
      + ''        ;
                background-color: rgba(''
      + config.lib.stylix.colors.base00-rgb-r
      + ","
      + config.lib.stylix.colors.base00-rgb-g
      + ","
      + config.lib.stylix.colors.base00-rgb-b
      + ","
      + ''        0.0);
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
                  color: #''
      + config.lib.stylix.colors.base04
      + ''        ;
              }

              #workspaces button:hover {
                  color: #''
      + config.lib.stylix.colors.base07
      + ''        ;
              }

              #workspaces button.active {
                  color: #''
      + config.lib.stylix.colors.base08
      + ''        ;
              }

              #workspaces button.focused {
                  color: #''
      + config.lib.stylix.colors.base0A
      + ''        ;
              }

              #workspaces button.visible {
                  color: #''
      + config.lib.stylix.colors.base05
      + ''        ;
              }

              #workspaces button.urgent {
                  color: #''
      + config.lib.stylix.colors.base09
      + ''        ;
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
                  color: #''
      + config.lib.stylix.colors.base07
      + ''        ;
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
                  color: #''
      + config.lib.stylix.colors.base0D
      + ''        ;
              }

              #memory {
                  color: #''
      + config.lib.stylix.colors.base0E
      + ''        ;
              }

              #battery {
                  color: #''
      + config.lib.stylix.colors.base0B
      + ''        ;
              }

              #battery.charging, #battery.plugged {
                  color: #''
      + config.lib.stylix.colors.base0C
      + ''        ;
              }

              @keyframes blink {
                  to {
                      background-color: #''
      + config.lib.stylix.colors.base07
      + ''        ;
                      color: #''
      + config.lib.stylix.colors.base00
      + ''        ;
                  }
              }

              #battery.critical:not(.charging) {
                  background-color: #''
      + config.lib.stylix.colors.base08
      + ''        ;
                  color: #''
      + config.lib.stylix.colors.base07
      + ''        ;
                  animation-name: blink;
                  animation-duration: 0.5s;
                  animation-timing-function: linear;
                  animation-iteration-count: infinite;
                  animation-direction: alternate;
              }

              label:focus {
                  background-color: #''
      + config.lib.stylix.colors.base00
      + ''        ;
              }

              #pulseaudio {
                  color: #''
      + config.lib.stylix.colors.base0C
      + ''        ;
              }

              #pulseaudio.muted {
                  color: #''
      + config.lib.stylix.colors.base04
      + ''        ;
              }

              #backlight {
                  color: #''
      + config.lib.stylix.colors.base0A
      + ''        ;
              }

              #idle_inhibitor {
                  color: #''
      + config.lib.stylix.colors.base04
      + ''        ;
              }

              #idle_inhibitor.activated {
                  color: #''
      + config.lib.stylix.colors.base0F
      + ''        ;
              }

              #tray > .passive {
                  -gtk-icon-effect: dim;
              }

              #tray > .needs-attention {
                  -gtk-icon-effect: highlight;
              }

              #clock {
                  color: #''
      + config.lib.stylix.colors.base0D
      + ''        ;
              }

              #custom-power {
                  color: #''
      + config.lib.stylix.colors.base0E
      + ''        ;
              }
      '';
  };
}
