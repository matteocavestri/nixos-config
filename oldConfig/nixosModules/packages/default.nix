{lib, ...}: {
  imports = [
    ./basepkgs.nix
    ./steam.nix
    ./packaging.nix
  ];

  system.packages = {
    basepkgs.enable = lib.mkDefault true;
    steam.enable = lib.mkDefault false;
    packaging = {
      flatpak.enable = lib.mkDefault false;
      appimage.enable = lib.mkDefault false;
    };
  };
}
