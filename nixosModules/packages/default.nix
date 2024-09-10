{lib, ...}: {
  imports = [
    ./basepkgs.nix
    ./steam.nix
  ];

  system.packages = {
    basepkgs.enable = lib.mkDefault true;
    steam.enable = lib.mkDefault false;
  };
}
