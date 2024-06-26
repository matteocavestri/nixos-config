{ config, lib, pkgs, systemSettings, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true; 
  services.xserver.xkb.layout = systemSettings.keymap;
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    xterm
    gedit
  ]) ++ (with pkgs.gnome; [
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
  ]);
  programs.dconf.enable = true;
  #environment.systemPackages = with pkgs; [ gnome.gnome-tweaks ]
}
