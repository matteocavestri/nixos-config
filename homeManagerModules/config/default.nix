{lib, ...}: {
  imports = [
    ./homemanager.nix
  ];

  user.config = {
    homemanager.enable = lib.mkDefault true;
  };
}
