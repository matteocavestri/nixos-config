{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set runtimepath+=~/.config/nvim
      source ~/.config/nvim/init.lua
    '';
  };
  
  home.file.".config/nvim".source = ./nvim;
  
  home.packages = with pkgs; [
    ripgrep
    bottom
    gdu
    
  ];
}


