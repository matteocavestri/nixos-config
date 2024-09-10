{
  pkgs,
  pkgs-unstable,
  ...
}: {
  # Depencency services
  system.services = {
    xorg.enable = true;
    displaymanager.lightdm.enable = true;
  };

  # Enable Budgie desktop environment
  services.xserver = {
    desktopManager.budgie.enable = true;
  };

  # Exclude budgie packages (Home Manager config uses some std packages for all desktops)
  environment.budgie.excludePackages = with pkgs; [
    vlc
    mate.eom
    mate.pluma
    mate.atril
    mate.engrampa
    mate.mate-calc
    mate.mate-system-monitor
    gnome.gnome-terminal
    pkgs-unstable.nemo
  ];
}
