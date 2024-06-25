{ pkgs, home-manager, ... }:

{
  home.packages = [ pkgs.alacritty ];
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window ={
      opacity = 0.85;
      padding.x = 5;
      padding.y = 5;
      decorations = "Full"; # Full, Buttonless, Transparent, None
      dynamic_padding = true;
    };
  };
}
