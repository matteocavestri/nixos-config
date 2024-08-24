{ pkgs, userSettings, systemSettings, ... }:
{
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;     
  programs.zsh.enable = true;

  imports = [
    (./. + "../../../hardware" + ("/" + systemSettings.hardware) + "/config.nix")
    ../../system/security/gpg.nix
    ../../system/config/fonts.nix
    ../../system/config/users.nix
    ../../system/pkgs/base.nix
    (./. + "../../../system/wm" + ( "/" + userSettings.wm) + ".nix")
  ];
}
