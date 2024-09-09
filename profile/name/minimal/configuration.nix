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

    # Configuration import
    ../../../system/config/default/default.nix
    # ../../../system/config/optimization/default.nix

    # Security import
    ../../../system/security/default.nix

    # Packages import
    ../../../system/packages/base.nix

    ../../../nixosModules/config/default.nix
  ];
}
