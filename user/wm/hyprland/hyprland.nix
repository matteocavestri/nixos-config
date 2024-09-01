{
  pkgs,
  lib,
  config,
  inputs,
  systemSettings,
  userSettings,
  ...
}: let
  hyprCursorSize = config.gtk.cursorTheme.size;
in {
  imports = [
    ../config.nix
    ./hypr/config.nix
    ./hypr/packages.nix
    ./hypr/hypridle.nix
    ./utils/fuzzel.nix
    ./utils/rofi.nix
    ./utils/waybar.nix
    ./utils/wlogout.nix
    ./hypr/hyprlock.nix
    ./utils/dunst.nix
    ./utils/swappy.nix
    ./ags/ags.nix
    (import ../../pkgs/dmenu-scripts/networkmanager-dmenu.nix {
      dmenu_command = "fuzzel -d";
      inherit config lib pkgs;
    })
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    package = pkgs.hyprland;
    plugins = [];
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = userSettings.term;
      "$fileManager" = "kitty -e lf";
      "$menu" = "fuzzel";
      "$editor" = "kitty -e nvim";
      monitor = ",2560x1600@60,auto,1.6";
      exec-once = [
        "dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY"
        "waybar"
        "dunst"
        "hyprpaper"
        "nm-applet"
        "blueman-applet"
        "hypridle"
        "sleep 5 && libinput-gestures"
      ];
      input = {
        kb_layout = systemSettings.keymap;
        follow_mouse = 1;
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = 1;
        };
      };
      cursor = {
        no_warps = false;
        inactive_timeout = 30;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_cancel_ratio = 0.15;
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      binds = {
        movefocus_cycles_fullscreen = false;
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      xwayland = {
        force_zero_scaling = true;
      };
      windowrulev2 = [
        "opacity 0.85,class:^(org.gnome.Nautilus)$"
        "opacity 0.85,class:^(org.gnome.Nautilus)$"
        "opacity 0.85,class:^(neovide)$"
        "opacity 0.85,class:^(neovide)$"
      ];
      layerrule = [
        "blur,waybar"
        "xray,waybar"
        "blur,launcher" # fuzzel
        "blur,gtk-layer-shell"
        "xray,gtk-layer-shell"
      ];
      blurls = [
        "waybar"
        "launcher" # fuzzel
        "gtk-layer-shell"
      ];
      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        "$mainMod, W, exec, $fileManager"
        "$mainMod, F, togglefloating"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo"
        "$mainMod, J, togglesplit"
        "$mainMod, E, exec, $editor"
        # TODO: Write a bash script to do screenshots
        # "$mainMod, G, exec, grim -g "$(slurp)" - | swappy -f -"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod SHIFT, B, exec, waybar"
        "$mainMod, I, exec, networkmanager_dmenu"
        ",XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        ",XF86KbdBrightnessUp, exec, brightnessctl --device=:white:kbd_backlight set +10%"
        ",XF86KbdBrightnessDown, exec, brightnessctl --device=:white:kbd_backlight set 10%-"
        ",XF86AudioRaiseVolume, exec, pamixer -i 10"
        ",XF86AudioLowerVolume, exec, pamixer -d 10"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
        "$mainMod ALT, mouse:272, resizewindow"
      ];
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland,x11,*"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "CLUTTER_BACKEND,wayland"
        "SDL_VIDEODRIVER,wayland"
        # "QT_SCALE_FACTOR,1.6"
        # "GDK_SCALE,1.6"
        # "ELM_SCALE,1.6"
      ];
    };
    # TODO: Move extraConfig
    extraConfig =
      ''
        exec-once = hyprctl setcursor ''
      + config.gtk.cursorTheme.name
      + " "
      + builtins.toString hyprCursorSize
      + ''

        # General Settings
         general { 
           gaps_in = 7
           gaps_out = 7
           border_size = 2
           col.active_border = 0xff''
      + config.lib.stylix.colors.base08
      + " "
      + ''0xff''
      + config.lib.stylix.colors.base09
      + " "
      + ''0xff''
      + config.lib.stylix.colors.base0A
      + " "
      + ''0xff''
      + config.lib.stylix.colors.base0B
      + " "
      + ''0xff''
      + config.lib.stylix.colors.base0C
      + " "
      + ''0xff''
      + config.lib.stylix.colors.base0D
      + " "
      + ''0xff''
      + config.lib.stylix.colors.base0E
      + " "
      + ''0xff''
      + config.lib.stylix.colors.base0F
      + " "
      + ''        270deg
                col.inactive_border = 0xaa''
      + config.lib.stylix.colors.base02
      + ''
            resize_on_border = true
            allow_tearing = false
          }

        # Decoration Settings
          decoration {
            rounding = 10
            active_opacity = 1.0
            inactive_opacity = 1.0
            drop_shadow = true
            shadow_range = 4
            shadow_render_power = 3
            col.shadow = rgba(1a1a1aee)
            blur {
              enabled = true
               size = 5
               passes = 2
               ignore_opacity = true
               contrast = 1.17
              brightness = ''
      + (
        if (config.stylix.polarity == "dark")
        then "0.8"
        else "1.25"
      )
      + ''
            xray = true
          }
        }


        bind = $mainMod, G, exec, grim -g "$(slurp)" - | swappy -f -

      '';
  };
}
