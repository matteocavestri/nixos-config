{lib, ...}: {
  imports = [
    ./basepkgs.nix
  ];

  system.packages = {
    basepkgs.enable = lib.mkDefault true;
  };
}
