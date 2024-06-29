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
    ../../system/hardware/graphics.nix
    ../../system/hardware/bluetooth.nix
# Driver imports
    ../../system/driver/apple-t2.nix
    ../../system/driver/intelgpu.nix
# Security imports
    ../../system/security/gpg.nix
    ../../system/security/users.nix
# Apps imports
    ../../system/apps/basepkgs.nix
    ../../system/apps/container.nix
    ../../system/apps/flatpak.nix
    ../../system/apps/virtualization.nix
    ../../system/apps/gaming.nix
# Style imports
    ../../system/style/stylix.nix
# Window manager imports
    ../../system/wm/fonts.nix
    (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix")
  ];
}
