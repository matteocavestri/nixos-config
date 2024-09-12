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
    (
      if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
      then gnome.gnome-terminal
      else gnome-terminal
    )
    (
      if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.11")
      then pkgs-unstable.nemo
      else nemo
    )
  ];
}
