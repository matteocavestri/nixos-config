{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    clamav
  ];
  services.clamav = {
    daemon.enable = true;
    scanner = {
      enable = true;
      interval = "*-*-* 04:00:00";
      scanDirectories = [
        "/home"
        "/var/lib"
        "/tmp"
        "/etc"
        "/var/tmp"
      ];
    };
    updater = {
      enable = true;
      interval = "hourly";
    };
  };
}
