{ pkgs, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  imports = [ 
# Default import
    ../../user/config.nix
# Apps imports
    ../../user/apps/editors/neovim.nix
    ../../user/apps/git/git.nix
    ../../user/apps/ranger/ranger.nix
# Development imports
    ../../user/lang/cc.nix
    ../../user/lang/python.nix

  ];

  # home.packages = with pkgs; [ ];
}
