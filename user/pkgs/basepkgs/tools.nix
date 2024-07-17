{pkgs, ...}: {
  home.packages = [
    pkgs.kubectl
    pkgs.talosctl
    pkgs.k9s
  ];
}
