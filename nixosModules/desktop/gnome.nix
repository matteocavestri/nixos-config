{
  pkgs,
  lib,
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
    udev.packages = with pkgs; [
      (
        if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
        then gnome.gnome-settings-daemon
        else gnome-settings-daemon
      )
    ];
  };

  # Ignore gnome default packages
  environment = {
    gnome.excludePackages = let
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

      # Filter packages per nixos version (for > 24.05)
      gnomePackage = pname:
        if lib.versionOlder (lib.versions.majorMinor lib.version) "24.11"
        then pkgs.gnome."${pname}"
        else pkgs."${pname}";
    in
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
