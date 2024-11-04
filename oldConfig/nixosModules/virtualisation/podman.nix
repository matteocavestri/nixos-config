{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.virtualisation = {
      podman.enable = lib.mkEnableOption "Enable podman";
      distrobox.enable = lib.mkEnableOption "Enable distrobox";
    };
  };

  # Enable podman
  config = lib.mkIf config.system.virtualisation.podman.enable {
    virtualisation.containers.enable = true;
    environment.systemPackages = with pkgs;
      [
        podman
      ]
      # Install distrobox
      ++ (lib.optionals config.system.virtualisation.distrobox.enable [
        distrobox
      ]);
  };
}
