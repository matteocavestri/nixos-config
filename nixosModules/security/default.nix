{lib, ...}: {
  imports = [
    ./server.nix
    ./system.nix
  ];

  system.security = {
    server = {
      openssh = {
        enable = lib.mkDefault false;
        password = lib.mkDefault true;
      };
    };
    sudors.enable = lib.mkDefault false;
    gpg.enable = lib.mkDefault true;
  };
}
