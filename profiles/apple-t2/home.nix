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
# Apps imports
    ../../user/apps/editor/neovim.nix
    ../../user/apps/terminal/alacritty.nix
    ../../user/apps/terminal/kitty.nix
    ../../user/apps/git/git.nix
    ../../user/apps/flatpak/flatpak.nix
    ../../user/apps/virtualization/virtualization.nix
    ../../user/apps/basepkgs/productivity.nix
    ../../user/apps/basepkgs/media.nix
    ../../user/apps/basepkgs/engineering.nix
# Development imports
    ../../user/lang/cc.nix
    ../../user/lang/go.nix
    ../../user/lang/lua.nix
    ../../user/lang/rust.nix
    ../../user/lang/python.nix
    ../../user/lang/javascript.nix
# Shell and CLI imports
    ../../user/shell/sh.nix
    ../../user/shell/cli-collection.nix
    ../../user/shell/tmux.nix
# Style imports
    #../../user/style/stylix.nix
# Window manager imports
    (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix")
  ];

  # home.packages = with pkgs; [ ];
}
