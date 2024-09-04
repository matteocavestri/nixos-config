{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../config.nix
    ../../style/qt.nix
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
      };
    };
  };
}
