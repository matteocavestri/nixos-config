{
  pkgs,
  systemSettings,
  ...
}: {
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    # Hardware configuration (systemSettings.profile.host)
    (./. + "../../../../profile/host" + ("/" + systemSettings.profile.host) + "/config.nix")
    ../../../nixosModules/default.nix
  ];
}
