{ pkgs, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };
  
  imports = [ 
    ../../user/shell/sh.nix # Shell config
    (./. + "../../../user/pkgs/browsers"+ ("/"+userSettings.browser)+".nix") # Browser definition
    ../../user/pkgs/flatpak/flatpak.nix # Flatpak config
    ../../user/pkgs/git/git.nix # Git config
    ../../user/pkgs/nh/nh.nix # nh (nixos/homemanager) config
    ../../user/pkgs/terminal/kitty.nix # Kitty config
    ../../user/pkgs/terminal/alacritty.nix # Alacritty config
    ../../user/pkgs/virtualization/virtualization.nix # Virtualization config
    ../../user/pkgs/editors/neve.nix # Neve editor import
    #../../user/pkgs/editors/neovim.nix # Neovim custom config import
    ../../user/pkgs/basepkgs/engineering.nix # Engineering pkgs
    ../../user/pkgs/basepkgs/media.nix # Media pkgs
    ../../user/pkgs/basepkgs/productivity.nix # Productivity pkgs
    ../../user/pkgs/basepkgs/tools.nix # tools pkgs
    (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix") # Window manager import

    ../../user/lang/cc.nix
    ../../user/lang/go.nix
    ../../user/lang/lua.nix
    ../../user/lang/rust.nix
    ../../user/lang/python.nix
    ../../user/lang/javascript.nix
  ];
}
