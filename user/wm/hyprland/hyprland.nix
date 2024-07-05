{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    ./config.nix
    ./packages.nix
    ./hypridle.nix
    ./fuzzel.nix
    ./waybar.nix
    ./wlogout.nix
    ./hyprlock.nix
    ./dunst.nix
    #./pyprland.nix
    ./eww/eww.nix
    ../../apps/nh/nh.nix
    (import ../../apps/dmenu-scripts/networkmanager-dmenu.nix {
      dmenu_command = "fuzzel -d"; inherit config lib pkgs;
    })
    ../../style/stylix.nix
  ];


  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [ 
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      inputs.hycov.packages.${pkgs.system}.hycov
      inputs.hyprgrass.packages.${pkgs.system}.default
    ];
    settings = { };
    xwayland = { enable = true; };
    systemd.enable = true;
    extraConfig = ''
      exec-once = dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY
      exec-once = hyprctl setcursor '' + config.gtk.cursorTheme.name + " " + builtins.toString config.gtk.cursorTheme.size + ''

      #monitor=,2560x1600@60,auto,2
      monitor=,2560x1600@60,auto,1.666667
      $terminal = kitty
      $fileManager = nautilus
      $menu = fuzzel
      $editor = neovide
      
      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = GDK_BACKEND,wayland,x11,*
      env = QT_QPA_PLATFORM,wayland;xcb
      env = QT_QPA_PLATFORMTHEME,qt5ct
      env = QT_AUTO_SCREEN_SCALE_FACTOR,1
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
      env = CLUTTER_BACKEND,wayland

      exec-once = waybar
      exec-once = dunst
      exec-once = hyprpaper
      exec-once = nm-applet
      exec-once = blueman-applet
      exec-once = hypridle
      exec-once = sleep 5 && libinput-gestures
      #exec-once = pypr
    
    # General Settings
      general { 
        gaps_in = 7
        gaps_out = 7
        border_size = 2
        col.active_border = 0xff'' + config.lib.stylix.colors.base08 + " " + ''0xff'' + config.lib.stylix.colors.base09 + " " + ''0xff'' + config.lib.stylix.colors.base0A + " " + ''0xff'' + config.lib.stylix.colors.base0B + " " + ''0xff'' + config.lib.stylix.colors.base0C + " " + ''0xff'' + config.lib.stylix.colors.base0D + " " + ''0xff'' + config.lib.stylix.colors.base0E + " " + ''0xff'' + config.lib.stylix.colors.base0F + " " + ''270deg
        col.inactive_border = 0xaa'' + config.lib.stylix.colors.base02 + ''
        resize_on_border = true
        allow_tearing = false
      }

    # Input Settings
      input {
        kb_layout = it
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =
        follow_mouse = 1
        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        touchpad {
          natural_scroll = true
          clickfinger_behavior = 1
        }
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
          brightness = '' + (if (config.stylix.polarity == "dark") then "0.8" else "1.25") + ''
          xray = true
        }
      }

# Animation Settings
      animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }

    # Cursor Settings
      cursor {
        no_warps = false
        inactive_timeout = 30
      }

    # Gesture Settings
      gestures {
        workspace_swipe = true
        workspace_swipe_cancel_ratio = 0.15
      }

    # Bindings
      $mainMod = SUPER
    # Example binds,
      bind = $mainMod, T, exec, $terminal
      bind = $mainMod, Q, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, W, exec, $fileManager
      bind = $mainMod, F, togglefloating,
      bind = $mainMod, R, exec, $menu
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle
      bind = $mainMod, E, exec, $editor
    # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d
    # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
    # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10
    # Example special workspace (scratchpad)
      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic
    # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
    # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    # Other Bindings
      bind = $mainMod SHIFT, B, exec, waybar
      #bind = $mainMod, Z, exec, pypr toggle term && hyprctl dispatch bringactivetotop
      #bind = $mainMod, F, exec, pypr toggle ranger && hyprctl dispatch bringactivetotop
      #bind = $mainMod, B, exec, pypr toggle btm && hyprctl dispatch bringactivetotop
      bind=SUPER,I,exec,networkmanager_dmenu
      #bind = $mainMod,V,exec,pypr toggle volume
      #bind = $mainMod,A,exec,pypr toggle term
      #bind = $mainMod,Y,exec,pypr attach
      #bind = $mainMod, B, exec, pypr expose
      bind = SUPER, N, hyprexpo:expo, toggle # can be: toggle, off/disable or on/enable
      bind=SUPER,TAB,hycov:toggleoverview
      bind=SUPER,left,hycov:movefocus,leftcross
      bind=SUPER,right,hycov:movefocus,rightcross
      bind=SUPER,up,hycov:movefocus,upcross
      bind=SUPER,down,hycov:movefocus,downcross
    
    # MBP Apple T2 Bindings
      bind = ,XF86MonBrightnessUp, exec, brightnessctl set +10%
      bind = ,XF86MonBrightnessDown, exec, brightnessctl set 10%-
      bind = ,XF86KbdBrightnessUp, exec, brightnessctl --device=:white:kbd_backlight set +10%
      bind = ,XF86KbdBrightnessDown, exec, brightnessctl --device=:white:kbd_backlight set 10%-
      bind = ,XF86AudioRaiseVolume, exec, pamixer -i 10
      bind = ,XF86AudioLowerVolume, exec, pamixer -d 10

      windowrulev2 = opacity 0.85,class:^(org.gnome.Nautilus)$
      windowrulev2 = opacity 0.85,class:^(org.gnome.Nautilus)$

      #windowrulev2 = opacity 0.85,class:^(firefox)$
      #windowrulev2 = opacity 0.85,class:^(firefox)$

      layerrule = blur,waybar
      layerrule = xray,waybar
      blurls = waybar
      layerrule = blur,launcher # fuzzel
      blurls = launcher # fuzzel
      layerrule = blur,gtk-layer-shell
      layerrule = xray,gtk-layer-shell
      blurls = gtk-layer-shell

      xwayland {
         force_zero_scaling = true
       }

      binds {
         movefocus_cycles_fullscreen = false
       }

# Other Setup
      #windowrulev2 = suppressevent maximize, class:.*
      misc { 
        force_default_wallpaper = 0
        disable_hyprland_logo = true
      }

# Plugins
      plugin {
        hyprexpo {
          columns = 3
          gap_size = 5
          bg_col = rgba(''+config.lib.stylix.colors.base08+''55)
          workspace_method = center first # [center/first] [workspace] e.g. first 1 or center m+1
          enable_gesture = false # laptop touchpad
          gesture_fingers = 3  # 3 or 4
          gesture_distance = 300 # how far is the "max"
          gesture_positive = false # positive = swipe down. Negative = swipe up.
        }
        hyprtrails {
          color = rgba(''+config.lib.stylix.colors.base08+''55)
        }
        hycov {
          overview_gappo = 40 # gaps width from screen edge
          overview_gappi = 20 # gaps width from clients
          enable_hotarea = 0 # enable mouse cursor hotarea, when cursor enter hotarea, it will toggle overview
          enable_click_action = 1 # enable mouse left button jump and right button kill in overview mode
          hotarea_monitor = all # monitor name which hotarea is in, default is all
          hotarea_pos = 1 # position of hotarea (1: bottom left, 2: bottom right, 3: top left, 4: top right)
          hotarea_size = 10 # hotarea size, 10x10
          swipe_fingers = 3 # finger number of gesture,move any directory
          move_focus_distance = 100 # distance for movefocus,only can use 3 finger to move
          enable_gesture = 0 # enable gesture
          auto_exit = 1 # enable auto exit when no client in overview
          auto_fullscreen = 0 # auto make active window maximize after exit overview
          only_active_workspace = 0 # only overview the active workspace
          only_active_monitor = 0 # only overview the active monitor
          enable_alt_release_exit = 0 # alt swith mode arg,see readme for detail
          alt_replace_key = Super_L # alt swith mode arg,see readme for detail
          alt_toggle_auto_next = 0 # auto focus next window when toggle overview in alt swith mode
          click_in_cursor = 1 # when click to jump,the target windwo is find by cursor, not the current foucus window.
          hight_of_titlebar = 0 # height deviation of title bar height
          show_special = 0 # show windwos in special workspace in overview.

        }
        touch_gestures {
          sensitivity = 4.0
          long_press_delay = 260
          workspace_swipe_fingers = 3
          #hyprgrass-bind = , edge:r:l, exec, hyprnome
          #hyprgrass-bind = , edge:l:r, exec, hyprnome --previous
          #hyprgrass-bind = , swipe:3:d, exec, nwggrid-wrapper

          hyprgrass-bind = , swipe:3:u, hycov:toggleoverview
          #hyprgrass-bind = , swipe:3:d, exec, nwggrid-wrapper

          #hyprgrass-bind = , swipe:3:l, exec, hyprnome --previous
          #hyprgrass-bind = , swipe:3:r, exec, hyprnome

          #hyprgrass-bind = , swipe:4:u, movewindow,u
          #hyprgrass-bind = , swipe:4:d, movewindow,d
          hyprgrass-bind = , swipe:3:l, movewindow,l
          hyprgrass-bind = , swipe:3:r, movewindow,r

          #hyprgrass-bind = , tap:3, fullscreen,1
          #hyprgrass-bind = , tap:4, fullscreen,0

          #hyprgrass-bindm = , longpress:2, movewindow
          #hyprgrass-bindm = , longpress:3, resizewindow
         }
      }

# Pyprland
      
       #$pavucontrol = class:^(pavucontrol)$
       #windowrulev2 = float,$pavucontrol
       #windowrulev2 = size 86% 40%,$pavucontrol
       #windowrulev2 = move 50% 6%,$pavucontrol
       #windowrulev2 = workspace special silent,$pavucontrol
       #windowrulev2 = opacity 0.80,$pavucontrol
       
       #$scratchpadsize = size 80% 85%
       
       #$scratchpad = class:^(scratchpad)$
       #windowrulev2 = float,$scratchpad
       #windowrulev2 = $scratchpadsize,$scratchpad
       #windowrulev2 = workspace special silent,$scratchpad
       #windowrulev2 = center,$scratchpad
    '';
  };
}
