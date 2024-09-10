{
  imports = [
    ../minimal/configuration.nix
    # ../../../system/services/virtualization/docker.nix
    ../../../system/services/virtualization/podman.nix
    ../../../system/services/server/cockpit.nix
  ];

  system = {
    security = {
      server.openssh.enable = true;
      sudors.enable = true;
    };
    virtualisation = {
      docker.enable = true;
    };
  };
}
