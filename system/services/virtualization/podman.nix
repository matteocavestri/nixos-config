{pkgs, ...}: {
  virtualisation.containers.enable = true;
  environment.systemPackages = with pkgs; [
    podman
  ];
}
