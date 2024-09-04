{systemSettings, ...}: {
  system.stateVersion = systemSettings.version;
  nixpkgs.config.allowUnfree = true;
}
