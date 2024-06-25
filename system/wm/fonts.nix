{ pkgs, ... }:

{
# Font settings
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ 
      jetbrains-mono
      inconsolata-nerdfont
      #(nerdfonts.override { fonts = [ "Inconsolata" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [  "Inconsolata Nerd Font" ];
        sansSerif = [ "Inconsolata Nerd Font" ];
        monospace = [ "Inconsolata Nerd Font Mono" ];
      };
    };
  };
}
