{pkgs, ...}: {
  home.packages = with pkgs; [
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
    delfin
    btrfs-assistant
    mission-center

    # Themes
    gnome.adwaita-icon-theme
  ];
}
