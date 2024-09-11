{pkgs, ...}: {
  # Dependency services
  system.services.wayland.enable = true;

  # Enable Plasma desktop environment
  services = {
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

  # This fixes a strange behaviour when switching home manager configuration using pipewire
  systemd.user.services."app-pulseaudio@autostart" = {
    enable = false;
    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/true";
      Type = "oneshot";
    };
  };

  # Exlude default packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    ark
    elisa
    gwenview
    okular
    kate
    dolphin
    dolphin-plugins
    ffmpegthumbs
    khelpcenter
  ];
}
