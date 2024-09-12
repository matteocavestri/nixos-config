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
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then gnome-calendar
          else gnome.gnome-calendar
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then nautilus
          else gnome.nautilus
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then gnome-calculator
          else gnome.gnome-calculator
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then gnome-music
          else gnome.gnome-music
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then gnome-font-viewer
          else gnome.gnome-font-viewer
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then gnome-maps
          else gnome.gnome-maps
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then file-roller
          else gnome.file-roller
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then gnome-contacts
          else gnome.gnome-contacts
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then gnome-disk-utility
          else gnome.gnome-disk-utility
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then gnome-weather
          else gnome.gnome-weather
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then gnome-clocks
          else gnome.gnome-clocks
        )
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then geary
          else gnome.geary
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
