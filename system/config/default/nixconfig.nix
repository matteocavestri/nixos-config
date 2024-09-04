{systemSettings, ...}: {
  system.stateVersion = systemSettings.nix.version;
  nixpkgs.config.allowUnfree = true;
  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "repl-flake"];
  };
}
