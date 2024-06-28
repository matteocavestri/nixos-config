{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    thunderbird
    libreoffice-fresh
    nextcloud-client
    protonmail-bridge
    whatsapp-for-linux
  ];
}
