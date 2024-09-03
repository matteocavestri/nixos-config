{pkgs, ...}: {
  home.packages = with pkgs; [
    protonmail-bridge
    evince
    mission-center
  ];
}
