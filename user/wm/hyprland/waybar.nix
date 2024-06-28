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
        height = 24; # Waybar height (to be removed for auto height)
        # width = 1280; # Waybar width
        # spacing = 4; # Gaps between modules (4px)

        # Choose the order of the modules
        modules-left = [ "custom/os" "hyprland/window" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "network" "pulseaudio" "backlight" "battery" "clock" "custom/power" ];
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
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 5;
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

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "tray" = {
          spacing = 10;
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          #format = "{:L%d-%m-%Y <small>[%a]</small> <tt><small>%p</small></tt>%H:%M}";
          #format = "{:%a %d-%m-%Y %H:%M}";
          format = "{:%a %H:%M}";
          on-click = "gnome-calendar";
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time} ";
          format-icons = ["" "" "" "" ""];
        };

        "network" = {
          #format-wifi = "{essid} ({signalStrength}%)  ";
          format-wifi = " ";
          format-ethernet = " {ifname}";
          tooltip-format = " {ifname} via {gwaddr}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "Disconnected ⚠ {ifname}";
          format-alt = " {ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          scroll-step = 5; # %, can be a float
          format = "{icon} {volume}%";
          format-bluetooth = " {icon} {volume}%";
          format-bluetooth-muted = "  {icon}";
          format-muted = "  {format_source}";
          #format-source = " {volume}%";
          #format-source-muted = "";
          format-icons = {
            default = ["" "" ""];
          };
          "on-click" = "pavucontrol";
          "on-click-right" = "foot -a pw-top pw-top";
        };
      };
    };
    style = ''
       * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: FontAwsome, ''+userSettings.font+'';
        font-size: 13px;
      }

      window#waybar {
        background: transparent;
        background-color: rgba('' + config.lib.stylix.colors.base00-rgb-r + "," + config.lib.stylix.colors.base00-rgb-g + "," + config.lib.stylix.colors.base00-rgb-b + "," + ''0.55);
        /*    border-bottom: 3px solid rgba(100, 114, 125, 0.5); */
        color: #'' + config.lib.stylix.colors.base07 + '';
        transition-property: background-color;
        transition-duration: .5s;
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
          border-radius: 8px;
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

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #custom-power,
      #custom-nixos,
      #window,
      #workspaces,
      #mpd {
          padding: 0 10px;
          color: #'' + config.lib.stylix.colors.base07 + '';
          border: none;
          border-radius: 8px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
          color: #'' + config.lib.stylix.colors.base0D + '';
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

      #network {
          color: #'' + config.lib.stylix.colors.base0D + '';
      }

      #custom-power {
          color: #'' + config.lib.stylix.colors.base0E + '';
      }

      #disk {
          color: #'' + config.lib.stylix.colors.base0F + '';
      }

      #backlight {
          color: #'' + config.lib.stylix.colors.base0A + '';
      }

      label.numlock {
          color: #'' + config.lib.stylix.colors.base04 + '';
      }

      label.numlock.locked {
          color: #'' + config.lib.stylix.colors.base0F + '';
      }

      #pulseaudio {
          color: #'' + config.lib.stylix.colors.base0C + '';
      }

      #pulseaudio.muted {
          color: #'' + config.lib.stylix.colors.base04 + '';
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
      }

      #idle_inhibitor {
          color: #'' + config.lib.stylix.colors.base04 + '';
      }

      #idle_inhibitor.activated {
          color: #'' + config.lib.stylix.colors.base0F + '';
      }
     '';
  };
}
