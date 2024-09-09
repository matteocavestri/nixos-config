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

    ../../../nixosModules/config/default.nix

    # Security import
    ../../../system/security/default.nix

    # Packages import
    ../../../system/packages/base.nix
  ];
}
