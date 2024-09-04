{systemSettings, ...}: {
  system.stateVersion = systemSettings.nix.version;
  nixpkgs.config.allowUnfree = true;
}
