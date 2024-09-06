{
  imports = [
    ../config.nix
    ../../style/qt.nix
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
