{pkgs, ...}: {
  services.wlsunset = {
    enable = true;
    package = pkgs.wlsunset;
    sunrise = "6:30";
    sunset = "19:30";
    temperature = {
      day = 6500;
      night = 4000;
    };
  };
}
