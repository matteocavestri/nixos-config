{ pkgs, ... }:

{
  home.packages = with pkgs; [
# Hypr
    waybar 
    hyprlock
    hyprcursor
    hyprpicker
    hypridle
    hyprpaper
    hyprland-protocols
    #pyprland
# Bar, Notification, Launchers
    wlogout
    dunst
    libnotify
    fuzzel
    rofi
# Themes
    numix-cursor-theme
    gnome.adwaita-icon-theme
# Controls
    brightnessctl
    pamixer
    grim
    slurp
    killall
    blueman
    wl-clipboard
# Programs
    gnome.nautilus
    gnome.gnome-calendar
    endeavour
    iotas
    gnome.gnome-calculator
    gnome-connections
    evince
    gnome.gnome-software
    gnome.eog
    alacritty
    kitty
    ranger
# xdg desktop
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland
    gsettings-desktop-schemas
# Wayland
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
# Utility
    feh
    killall
    libinput-gestures
    gnome.gvfs
    flameshot
# Services
    pinentry-gtk2
    
    tmux
    xorg.xev
    tree
    libva-utils
    gnome.zenity
    wlr-randr
    wtype
    ydotool
    fnott
    keepmenu
    wev
    wlsunset
    nwg-launchers
  ]; 
}
