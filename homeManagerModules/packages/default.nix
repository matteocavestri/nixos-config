{lib, ...}: {
  imports = [
    ./editor.nix
    ./flatpak.nix
  ];

  user.packages = {
    nevica = {
      enable = lib.mkDefault false;
      neovide = lib.mkDefault false;
    };
    flatpak = {
      enable = lib.mkDefault false;
      customizations = lib.mkDefault false;
    };
  };
}
