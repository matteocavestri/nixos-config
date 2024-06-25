{ pkgs, userSettings, ... }:

{
# Shell configuration
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    ../../system/hardware-configuration.nix
    ../../system/hardware/substituter-t2.nix
    ../../system/hardware/pipewire.nix
    ../../system/hardware/locale.nix
    ../../system/hardware/touchpad.nix
    ../../system/security/gpg.nix
    ../../system/wm/fonts.nix
    ../../system/hardware/systemdboot-t2.nix
    ../../system/apps/basepkgs.nix
    ../../system/apps/docker.nix
    ../../system/apps/flatpak.nix
    ../../system/apps/virtualization.nix
    ../../system/security/users.nix
    (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix")
  ];
}
