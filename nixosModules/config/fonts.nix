{
  pkgs,
  userSettings,
  lib,
  config,
  ...
}: {
  options = {
    system.config.fonts.enable = lib.mkEnableOption "Enable custom fonts";
  };

  config = lib.mkIf config.system.config.fonts.enable {
    fonts = {
      enableDefaultPackages = true;

      # Default fonts for productivity and terminal (Nerd Fonts)
      packages = with pkgs; [
        liberation_ttf
        inconsolata-nerdfont
        font-awesome
        noto-fonts-emoji
        # ibm-plex
      ];

      # Default font configuration
      fontconfig = {
        defaultFonts = {
          serif = ["${userSettings.appearance.font}"];
          sansSerif = ["${userSettings.appearance.font}"];
          monospace = ["Inconsolata Nerd Font Mono"];
        };
      };
    };
  };
}
