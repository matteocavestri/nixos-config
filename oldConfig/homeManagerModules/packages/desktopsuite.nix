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
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.gnome-calendar
          else gnome-calendar
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.nautilus
          else nautilus
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.gnome-calculator
          else gnome-calculator
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.gnome-music
          else gnome-music
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.gnome-font-viewer
          else gnome-font-viewer
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.gnome-maps
          else gnome-maps
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.file-roller
          else file-roller
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.gnome-contacts
          else gnome-contacts
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.gnome-disk-utility
          else gnome-disk-utility
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.gnome-weather
          else gnome-weather
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.gnome-clocks
          else gnome-clocks
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
          then gnome.geary
          else geary
        )
        glib
        gnome-connections
        endeavour
        iotas
        evince
        mission-center
        tracker
        tracker-miners
        snapshot
        baobab
        loupe
        gnome-text-editor
        gnome-online-accounts-gtk
        vlc
      ];
    };
  };
}
