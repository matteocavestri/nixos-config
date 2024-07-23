{
  pkgs,
  inputs,
  ...
}: {
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
    wlogout
    dunst
    libnotify
    fuzzel
    inputs.pyprland.packages.${pkgs.system}.pyprland
    python312Packages.aiofiles

    # Controls
    brightnessctl
    pamixer
    grim
    slurp
    swappy
    killall
    blueman
    wl-clipboard
    wl-clipboard-x11
    xdg-utils
    gsettings-desktop-schemas
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    libinput-gestures
    pavucontrol
    playerctl

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
    zed-editor
    delfin
    btrfs-assistant

    # Themes
    gnome.adwaita-icon-theme
  ];
}
