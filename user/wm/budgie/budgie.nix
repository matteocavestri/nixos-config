{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../config.nix
  ];
  home.packages = [
    pkgs.gnome.gnome-calendar
  ];
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        clock-format = "24h";
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file://" + config.stylix.image;
        picture-uri-dark = "file://" + config.stylix.image;
      };
    };
  };
}
