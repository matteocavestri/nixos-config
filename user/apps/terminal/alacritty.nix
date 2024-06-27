{ pkgs, home-manager, ... }:

{
  home.packages = [ pkgs.alacritty ];

  programs.alacritty.enable = true;
}
