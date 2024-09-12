# {pkgs, ...}: {
#   # Depencency services
#   system.services.wayland.enable = true;
#   hardware.pulseaudio.enable = false;
#   # Enable Gnome desktop environment and gdm display manager
#   services = {
#     xserver = {
#       displayManager.gdm.enable = true;
#       desktopManager.gnome.enable = true;
#     };
#     udev.packages = with pkgs; [gnome.gnome-settings-daemon];
#   };
#   # Ignore gnome default packages
#   environment = {
#     gnome.excludePackages = with pkgs; [
#       gnome-photos
#       gnome-tour
#       xterm
#       gedit
#       snapshot
#       baobab
#       tracker
#       tracker-miners
#       gnome-connections
#       gnome-text-editor
#       gnome-console
#       gnome-builder
#       loupe
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-calendar
#         else gnome-calendar
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.nautilus
#         else nautilus
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-calculator
#         else gnome-calculator
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-music
#         else gnome-music
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-font-viewer
#         else gnome-font-viewer
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-maps
#         else gnome-maps
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.file-roller
#         else file-roller
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-contacts
#         else gnome-contacts
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-disk-utility
#         else gnome-disk-utility
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-weather
#         else gnome-weather
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-clocks
#         else gnome-clocks
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.geary
#         else geary
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-system-monitor
#         else gnome-system-monitor
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.gnome-logs
#         else gnome-logs
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.dconf-editor
#         else dconf-editor
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.simple-scan
#         else simple-scan
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.devhelp
#         else devhelp
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.cheese
#         else cheese
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.epiphany
#         else epiphany
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.evince
#         else evince
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.totem
#         else totem
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.tali
#         else tali
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.iagno
#         else iagno
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.hitori
#         else hitori
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.atomix
#         else atomix
#       )
#       (
#         if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
#         then gnome.yelp
#         else yelp
#       )
#     ];
#   };
# }
{
  pkgs,
  lib,
  config,
  ...
}: {
  # Depencency services
  system.services.wayland.enable = true;
  hardware.pulseaudio.enable = false;

  # Enable Gnome desktop environment and gdm display manager
  services = {
    xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    udev.packages = with pkgs; [gnome.gnome-settings-daemon];
  };

  # Ignore gnome default packages
  environment = {
    gnome.excludePackages = let
      # Lista dei pacchetti che possono avere il prefisso "gnome."
      packagesWithPrefix = [
        "gnome-calendar"
        "nautilus"
        "gnome-calculator"
        "gnome-music"
        "gnome-font-viewer"
        "gnome-maps"
        "file-roller"
        "gnome-contacts"
        "gnome-disk-utility"
        "gnome-weather"
        "gnome-clocks"
        "geary"
        "gnome-system-monitor"
        "gnome-logs"
        "dconf-editor"
        "simple-scan"
        "devhelp"
        "cheese"
        "epiphany"
        "evince"
        "totem"
        "tali"
        "iagno"
        "hitori"
        "atomix"
        "yelp"
      ];

      # Funzione per aggiungere il prefisso "gnome." se necessario
      gnomePackage = pname:
        if lib.versionOlder (lib.versions.majorMinor lib.version) "24.11"
        then pkgs.gnome."${pname}"
        else pkgs."${pname}";
    in
      # Applicazione del ciclo per gestire tutti i pacchetti
      (with pkgs; [
        gnome-photos
        gnome-tour
        xterm
        gedit
        snapshot
        baobab
        tracker
        tracker-miners
        gnome-connections
        gnome-text-editor
        gnome-console
        gnome-builder
        loupe
      ])
      ++ map gnomePackage packagesWithPrefix;
  };
}
