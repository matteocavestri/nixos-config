{
  systemSettings,
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ../display/lightdm.nix
  ];
  system.services.xorg.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.budgie.enable = true;
    xkb.layout = systemSettings.host.keymap;
  };
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
