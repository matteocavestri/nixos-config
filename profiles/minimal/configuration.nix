{
  pkgs,
  userSettings,
  systemSettings,
  ...
}: {
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    (./. + "../../../hardware" + ("/" + systemSettings.hardware) + "/config.nix")
    ../../system/hardware/kernel.nix
    ../../system/security/gpg.nix
    ../../system/config/fonts.nix
    ../../system/config/users.nix
    ../../system/config/systemd.nix
    ../../system/config/optimize.nix
    ../../system/pkgs/base.nix
  ];
}
