{pkgs, ...}: {
  home.packages = with pkgs; [
    nextcloud-client
    protonmail-bridge
  ];
}
