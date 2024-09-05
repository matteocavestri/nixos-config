{pkgs, ...}: {
  home.packages = with pkgs; [
    tor-browser
    onionshare-gui
    gnunet-gtk
    i2p
  ];
}
