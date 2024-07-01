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
    ../../user/apps/editors/neovim.nix
    ../../user/apps/git/git.nix
    ../../user/apps/ranger/ranger.nix
# Development imports
    ../../user/lang/cc.nix
    ../../user/lang/go.nix
    ../../user/lang/python.nix
    ../../user/lang/java.nix
# Shell and CLI imports
    ../../user/shell/sh.nix
    ../../user/shell/tmux.nix
  ];

  # home.packages = with pkgs; [ ];
}
