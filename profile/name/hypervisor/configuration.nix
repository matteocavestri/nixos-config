{
  imports = [
    ../server/configuration.nix
    ../../../nixosModules/virtualisation/default.nix
  ];

  system = {
    virtualisation = {
      qemu = {
        enable = true;
        winsupport = true;
      };
    };
  };
}
