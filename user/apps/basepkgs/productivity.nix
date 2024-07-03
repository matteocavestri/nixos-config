{ pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    libreoffice-fresh
    nextcloud-client
    protonmail-bridge
    whatsapp-for-linux 
  ];
}
