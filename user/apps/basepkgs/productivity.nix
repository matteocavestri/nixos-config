{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    tree
    libreoffice-fresh
    nextcloud-client
    protonmail-bridge
  ];
}
