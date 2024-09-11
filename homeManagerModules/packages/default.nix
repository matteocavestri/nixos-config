{lib, ...}: {
  imports = [
    ./editor.nix
    ./flatpak.nix
    ./code.nix
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
    langs = {
      c.enable = lib.mkDefault true;
      go.enable = lib.mkDefault false;
      jvm.enable = lib.mkDefault false;
      web.enable = lib.mkDefault false;
      lua.enable = lib.mkDefault false;
      rust.enable = lib.mkDefault false;
      zig.enable = lib.mkDefault false;
      python.enable = lib.mkDefault false;
    };
    git.enable = lib.mkDefault true;
  };
}
