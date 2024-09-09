{
  config,
  lib,
  ...
}: {
  options = {
    system.config.garbagecollect.enable = lib.mkEnableOption "Enable Nix Garbage Collection";
  };

  config = lib.mkIf config.system.config.garbagecollect.enable {
    nix = {
      settings.auto-optimise-store = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}
