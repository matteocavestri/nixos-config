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
    pamixer
    pavucontrol
    playerctl
  ];
}
