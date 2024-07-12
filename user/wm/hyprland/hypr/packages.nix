{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
# Hypr
    waybar 
    eww
    hyprlock
    hyprcursor
    hyprpicker
    hypridle
    hyprpaper
    hyprland-protocols
    inputs.pyprland.packages.${pkgs.system}.pyprland
# Bar, Notification, Launchers
    wlogout
    dunst
    libnotify
    fuzzel
    rofi
# Themes
    numix-cursor-theme
    gnome.adwaita-icon-theme
    adwaita-qt
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
# xdg desktop
    xdg-utils
    gsettings-desktop-schemas
# Wayland
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
# Utility
    killall
    libinput-gestures
# Services
    gnome.zenity
    wlr-randr
    wtype
    ydotool
    fnott
    keepmenu
    wev
    wlsunset
  ]; 
}
