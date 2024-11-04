{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    system.packages.basepkgs.enable = lib.mkEnableOption "Enable basepkgs";
  };

  # Enable basepkgs
  config = lib.mkIf config.system.packages.basepkgs.enable {
    environment = {
      defaultPackages = [];
      systemPackages = [
        pkgs.vim
        pkgs.wget
        pkgs.git
        pkgs.nh
        pkgs.home-manager
        inputs.cave.packages.${pkgs.system}.cave # Cave is a nixos and homemanager utility for managing switch, boot, build and test
      ];
    };
  };
}
