{
  pkgs,
  userSettings,
  ...
}: {
  # Font settings
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      liberation_ttf
      inconsolata-nerdfont
      font-awesome
      noto-fonts-emoji
      # ibm-plex
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["${userSettings.font}"];
        sansSerif = ["${userSettings.font}"];
        monospace = ["Inconsolata Nerd Font Mono"];
      };
    };
  };
}
