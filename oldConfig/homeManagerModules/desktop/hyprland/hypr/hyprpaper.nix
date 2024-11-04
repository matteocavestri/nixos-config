{config, ...}: {
  home.file.       ".config/hypr/hyprpaper.conf".text =
    ''
      preload = ''
    + config.stylix.image
    + ''

      wallpaper = ,''
    + config.stylix.image
    + ''
    '';
}
