{
  imports = [
    ../config.nix
  ];
  user.services.qtstyle.enable = true;
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
