{
  imports = [
    ../server/configuration.nix
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
