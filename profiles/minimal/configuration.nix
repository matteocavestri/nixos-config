{
  pkgs,
  systemSettings,
  ...
}: {
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    (./. + "../../../hardware" + ("/" + systemSettings.profile.hardware) + "/config.nix")
    ../../system/security/gpg.nix
    ../../system/security/sudo.nix
    ../../system/security/rtkit.nix
    ../../system/config/nixconfig.nix
    ../../system/config/fonts.nix
    ../../system/config/users.nix
    ../../system/config/systemd.nix
    ../../system/config/optimize.nix
    ../../system/config/kernel.nix
    ../../system/config/locale.nix
    ../../system/pkgs/base.nix
  ];
}
