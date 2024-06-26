{ pkgs, userSettings, ... }:

{
# Shell configuration
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
# Hardware imports
    ../../system/hardware-configuration.nix
    ../../system/hardware/pipewire.nix
    ../../system/hardware/locale.nix
    ../../system/hardware/touchpad.nix
    ../../system/hardware/networking.nix
# Driver imports
    ../../system/driver/apple-t2.nix
# Security imports
    ../../system/security/gpg.nix
    ../../system/security/users.nix
# Apps imports
    ../../system/apps/basepkgs.nix
    ../../system/apps/docker.nix
    ../../system/apps/flatpak.nix
    ../../system/apps/virtualization.nix
# Window manager imports
    ../../system/wm/fonts.nix
    (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix")
  ];
}
