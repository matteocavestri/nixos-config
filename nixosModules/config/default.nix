{lib, ...}: {
  imports = [
    ./locale.nix
    ./zram.nix
    ./fonts.nix
    ./nix.nix
    ./users.nix
    ./network.nix
  ];

  system.config = {
    locale.enable = lib.mkDefault true;
    zram.enable = lib.mkDefault false;
    garbagecollect.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
    flake.enable = lib.mkForce true;
    unfree.enable = lib.mkDefault false;
    linker.enable = lib.mkDefault true;
    users.enable = lib.mkForce true;
    network = {
      enable = lib.mkDefault true;
      wgsupport = lib.mkDefault false;
    };
    wifi = {
      wpasupplicant = lib.mkDefault false;
      iwd = lib.mkDefault false;
    };
    bluetooth.enable = lib.mkDefault false;
  };
}
