{ config, pkgs, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  imports = [ 
    ../../user/app/editor/neovim.nix
    ../../user/app/terminal/alacritty.nix
    ../../user/app/terminal/kitty.nix
    ../../user/app/git/git.nix
    ../../user/app/flatpak/flatpak.nix
    ../../user/app/virtualization/virtualization.nix
    ../../user/lang/cc.nix
    ../../user/lang/go.nix
    ../../user/lang/lua.nix
    ../../user/lang/rust.nix
    ../../user/lang/python.nix
    ../../user/lang/javascript.nix
    ../../user/shell/sh.nix
    ../../user/shell/cli-collection.nix
    (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix")
  ];

  home.packages = with pkgs; [
    firefox
    tree
    libreoffice-fresh
    protonmail-bridge
    wine
    bottles
    gimp
    krita
    kdenlive
    inkscape
    freecad
    obs-studio
    nextcloud-client
    ardour
    mpv
  ];
}
