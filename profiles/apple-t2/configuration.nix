{ pkgs, userSettings, ... }:

{
# Shell configuration
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
# Default import
    ../../system/config.nix
    ./hardware-configuration.nix
# Hardware imports
    ../../system/hardware/pipewire.nix
    ../../system/hardware/touchpad.nix
    ../../system/hardware/graphics.nix
    ../../system/hardware/bluetooth.nix
# Driver imports
    ../../system/driver/apple-t2.nix
    ../../system/driver/intelgpu.nix
# Apps imports
    ../../system/apps/container.nix
    ../../system/apps/flatpak.nix
    ../../system/apps/virtualization.nix
    ../../system/apps/gaming.nix
# Style imports
    #../../system/style/stylix.nix
# Window manager imports
    ../../system/wm/fonts.nix
    (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix")
  ];
}
