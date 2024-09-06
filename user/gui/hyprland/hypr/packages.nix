{pkgs, ...}: {
  home.packages = with pkgs; [
    blueman
    killall
    hyprcursor
    hyprpicker
    hyprpaper
    hyprland-protocols
    pamixer
    pavucontrol
    playerctl
  ];
}
