{
  imports = [
    ../minimal/configuration.nix
  ];

  system = {
    security = {
      server.openssh.enable = true;
      sudors.enable = true;
    };
    services.cockpit.enable = true;
    config.fonts.enable = false;
    virtualisation = {
      qemu = {
        enable = true;
        winsupport = true;
      };
      docker.enable = true;
      podman.enable = true;
    };
  };
}
