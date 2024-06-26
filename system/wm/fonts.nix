{ pkgs, ... }:

{
# Font settings
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ 
      jetbrains-mono
      inconsolata-nerdfont
      font-awesome
      noto-fonts
      noto-fonts-emoji
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
