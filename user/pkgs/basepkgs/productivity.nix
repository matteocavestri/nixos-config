{pkgs, ...}: {
  home.packages = with pkgs; [
    thunderbird
    libreoffice-qt6-still
    nextcloud-client
    protonmail-bridge
    whatsapp-for-linux
  ];
}
