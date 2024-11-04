{
  imports = [
    ../minimal/configuration.nix
  ];

  system = {
    security = {
      server.openssh.enable = true;
      server.increaseOpenFiles = true;
      sudors.enable = true;
    };
    virtualisation = {
      k3s.enable = true;
    };
    config.fonts.enable = false;
    system.kernel.increaseInotify = true;
  };
}
