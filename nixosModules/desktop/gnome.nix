{pkgs, ...}: {
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
    gnome.excludePackages =
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
      ++ (with pkgs.gnome; [
        file-roller
        gnome-contacts
        gnome-disk-utility
        gnome-weather
        gnome-clocks
        gnome-calendar
        gnome-system-monitor
        gnome-logs
        dconf-editor
        simple-scan
        devhelp
        gnome-maps
        nautilus
        gnome-font-viewer
        gnome-calculator
        cheese # webcam tool
        gnome-music
        gnome-terminal
        epiphany # web browser
        geary # email reader
        evince # document viewer
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        yelp
      ]);
  };
}
