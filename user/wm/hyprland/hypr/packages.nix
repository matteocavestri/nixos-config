{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.nautilus
    gnome.gnome-calendar
    gnome.gnome-calculator
    gnome-connections
    gnome.gnome-software
    gnome.eog
    delfin
    mission-center
  ];
}
