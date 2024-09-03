{pkgs, ...}: {
  home.packages = with pkgs; [
    blueman
    killall
    hyprcursor
    hyprpicker
    hyprpaper
    hyprland-protocols
    hyprlock
    hypridle
    dunst
    libnotify
    gnome.nautilus
    gnome.gnome-calendar
    gnome.gnome-calculator
    gnome-connections
    gnome.gnome-software
    gnome.eog
  ];
}
