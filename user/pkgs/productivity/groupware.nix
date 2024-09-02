{pkgs, ...}: {
  home.packages = with pkgs; [
    endeavour
    iotas
    nextcloud-client
  ];
}
