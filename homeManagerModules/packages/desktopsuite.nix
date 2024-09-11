{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    user.packages.desktopsuite.enable = lib.mkEnableOption "Install all desktop suite packages";
  };

  # Install desktop suite packages if the user wants it
  config = lib.mkIf config.user.packages.desktopsuite.enable {
    home = {
      packages = with pkgs; [
        glib
        gnome.gnome-calendar
        gnome.nautilus
        gnome.gnome-calculator
        gnome-connections
        endeavour
        iotas
        evince
        mission-center
        gnome.gnome-music
        tracker
        tracker-miners
        snapshot
        baobab
        loupe
        gnome.gnome-font-viewer
        gnome-text-editor
        gnome.gnome-maps
        gnome.file-roller
        gnome.gnome-contacts
        gnome-online-accounts-gtk
        gnome.gnome-disk-utility
        gnome.gnome-weather
        gnome.gnome-clocks
        gnome.geary
        vlc
      ];
    };
  };
}
