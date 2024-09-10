# TODO: delete .server and .network and use directly the service
{lib, ...}: {
  imports = [
    ./server.nix
    ./system.nix
    ./desktop.nix
    ./network.nix
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
    gnome-keyring.enable = lib.mkDefault false;
    polkit.enable = lib.mkDefault false;
    network = {
      dnscrypt = {
        enable = lib.mkDefault false;
        ipv6 = lib.mkDefault false;
      };
    };
  };
}
