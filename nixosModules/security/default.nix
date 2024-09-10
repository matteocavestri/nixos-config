{lib, ...}: {
  imports = [
    ./server.nix
  ];

  system.security = {
    server = {
      openssh = {
        enable = lib.mkDefault false;
        password = lib.mkDefault true;
      };
    };
  };
}
