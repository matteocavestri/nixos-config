{pkgs, ...}: {
  home.packages = with pkgs; [
    thunderbird
    nextcloud-client
    protonmail-bridge
  ];
}
