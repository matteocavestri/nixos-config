{lib, ...}: {
  imports = [
    ./locale.nix
    ./zram.nix
    ./garbagecollect.nix
  ];

  system.config = {
    locale.enable = lib.mkDefault true;
    zram.enable = lib.mkDefault false;
    garbagecollect.enable = lib.mkDefault true;
  };
}
