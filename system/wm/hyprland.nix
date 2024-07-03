{ pkgs, lib, ... }:

{
  imports = [
    ../hardware/pipewire.nix
    ./wayland.nix
    ./fonts.nix
    ../style/stylix.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP= "Hyprland";
  };

  security = {
    pam.services.login.enableGnomeKeyring = true;
    polkit.enable = true;
  };

  #services.gvfs = {
  #  enable = true;
  #  package = pkgs.gnome.gvfs;
  #};

  environment = {
    plasma5.excludePackages = [ pkgs.kdePackages.systemsettings ];
    plasma6.excludePackages = [ pkgs.kdePackages.systemsettings ];
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];

  environment.systemPackages = with pkgs; [
    polkit_gnome
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}
