{
  systemSettings,
  lib,
  config,
  pkgs,
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
    system.stateVersion = systemSettings.nix.version;
    nix = {
      settings = {
        trusted-users = ["@wheel"];
        auto-optimise-store = lib.mkIf config.system.config.garbagecollect.enable true;
        experimental-features = lib.mkIf config.system.config.flake.enable ["nix-command" "flakes" "repl-flake"];
      };
      gc = lib.mkIf config.system.config.garbagecollect.enable {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };

    nixpkgs.config.allowUnfree = lib.mkIf config.system.config.unfree.enable true;

    systemd = lib.mkIf config.system.config.linker.enable {
      tmpfiles = {
        rules = [
          "L+ /lib/${builtins.baseNameOf pkgs.stdenv.cc.bintools.dynamicLinker} - - - - ${pkgs.stdenv.cc.bintools.dynamicLinker}"
          "L+ /lib64 - - - - /lib"
        ];
      };
    };
  };
}
