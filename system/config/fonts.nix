{ pkgs, userSettings, ... }:

{
# Font settings
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ 
      jetbrains-mono
      intel-one-mono
      inconsolata-nerdfont
      font-awesome
      noto-fonts
      noto-fonts-emoji
      #(nerdfonts.override { fonts = [ "Inconsolata" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "${userSettings.font}" ];
        sansSerif = [ "${userSettings.font}" ];
        monospace = [ "Intel One Mono" ];
      };
    };
  };
}
