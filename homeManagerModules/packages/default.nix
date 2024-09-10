{lib, ...}: {
  imports = [
    ./editor.nix
  ];

  user.packages = {
    nevica = {
      enable = lib.mkDefault false;
      neovide = lib.mkDefault false;
    };
  };
}
