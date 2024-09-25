{
  imports = [
    ../minimal/configuration.nix
  ];

  system = {
    security = {
      server.openssh.enable = true;
      sudors.enable = true;
    };
    virtualisation = {
      k3s.enable = true;
    };
    services.cockpit.enable = true;
    config.fonts.enable = false;
  };
}
