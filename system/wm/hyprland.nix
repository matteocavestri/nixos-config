{ pkgs, lib, ... }:

{
  imports = [
    ../hardware/pipewire.nix
    ./wayland.nix
    ./fonts.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    #package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
  };

  security = {
    pam.services.login.enableGnomeKeyring = true;
  };

  hardware = {
    graphics.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.systemPackages = with pkgs; [
    waybar
    dunst
    libnotify
    rofi-wayland
    wl-clipboard   
    grim           
    slurp
    swaylock
    wofi
    bemenu
    dolphin
  ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}
