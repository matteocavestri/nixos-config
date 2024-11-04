{
  lib,
  types,
  config,
  pkgs,
  inputs,
  ...
}: {
  options = {
    neve.config = {
      # Configure default nix version
      systemVersion = lib.mkOption {
        types = types.str;
        default = "24.11";
      };

      # Configure dynamic linker for libraries and packages
      linker.enable = lib.mkOption {
        type = types.bool;
        default = true;
      };

      # Setup Nix Garbage collector to delete-older-than 30 days
      garbageCollect.enable = lib.mkOption {
        type = types.bool;
        default = true;
      };
    };
  };

  config = {
    # Setup system version by default
    system.stateVersion = config.neve.config.systemVersion;
    nix = {
      # Setup default nixpkgs as this flake
      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      settings = {
        # Setup root group as trusted user
        trusted-users = ["@wheel"];
        # Activate flakes
        experimental-features = ["nix-command" "flakes"];
        # Optimize store if set
        auto-optimise-store = lib.mkIf config.neve.config.garbageCollect.enable true;
      };

      # Main garbage collection settings
      gc = lib.mkIf config.neve.config.garbageCollect.enable {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
    # nixpkgs.config.allowUnfree = lib.mkIf config.system.config.unfree.enable true;

    # Dynamic linker setup for libraries and packages
    systemd = lib.mkIf config.neve.config.linker.enable {
      tmpfiles = {
        rules = [
          "L+ /lib/${builtins.baseNameOf pkgs.stdenv.cc.bintools.dynamicLinker} - - - - ${pkgs.stdenv.cc.bintools.dynamicLinker}"
          "L+ /usr/local/bin - - - - /run/current-system/sw/bin/"
        ];
      };
    };
  };
}
