{pkgs, ...}: {
  home.packages = with pkgs; [
    blueman
    killall
    hyprcursor
    hyprpaper
    hyprland-protocols
    pavucontrol
  ];
}
