{lib, ...}: {
  imports = [
    ./locale.nix
    ./zram.nix
    ./garbagecollect.nix
    ./fonts.nix
  ];

  system.config = {
    locale.enable = lib.mkDefault true;
    zram.enable = lib.mkDefault false;
    garbagecollect.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
  };
}
