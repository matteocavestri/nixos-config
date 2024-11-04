{
  systemSettings,
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    system.config = {
      flake.enable = lib.mkEnableOption "Enable Flake Support";
      unfree.enable = lib.mkEnableOption "Enable unfree software";
      linker.enable = lib.mkEnableOption "Enable dynamic linker in /lib /lib64";
      garbagecollect.enable = lib.mkEnableOption "Enable Nix garbage collection";
    };
  };

  config = {
    # Setup system version by default
    system.stateVersion = systemSettings.nix.version;
    nix = {
      settings = {
        trusted-users = ["@wheel"];

        # Optimize store if set
        auto-optimise-store = lib.mkIf config.system.config.garbagecollect.enable true;

        # Activate flakes (lib.mkForce true) because my config needs flakes
        experimental-features = lib.mkIf config.system.config.flake.enable ["nix-command" "flakes"];
      };

      # Main garbage collection settings
      gc = lib.mkIf config.system.config.garbagecollect.enable {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      # Setup Nix path
      nixPath = lib.mkIf config.system.config.flake.enable ["nixpkgs=${inputs.nixpkgs}"];
    };

    # Allow unfree software from nixpkgs
    nixpkgs.config.allowUnfree = lib.mkIf config.system.config.unfree.enable true;

    # Dynamic linker from /lib /lib64
    systemd = lib.mkIf config.system.config.linker.enable {
      tmpfiles = {
        rules = [
          "L+ /lib/${builtins.baseNameOf pkgs.stdenv.cc.bintools.dynamicLinker} - - - - ${pkgs.stdenv.cc.bintools.dynamicLinker}"
          "L+ /lib64 - - - - /lib"
          "L+ /usr/local/bin - - - - /run/current-system/sw/bin/"
        ];
      };
    };
  };
}
