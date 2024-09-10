{
  imports = [
    ../minimal/configuration.nix
    ../../../nixosModules/virtualisation/default.nix
    ../../../nixosModules/services/default.nix

    ../../../system/services/server/cockpit.nix
  ];

  system = {
    security = {
      server.openssh.enable = true;
      sudors.enable = true;
    };
    virtualisation = {
      docker.enable = true;
      podman.enable = true;
    };
  };
}
