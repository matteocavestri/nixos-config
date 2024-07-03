  { pkgs, lib, systemSettings, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
    displayManager.lightdm.enable = true;
    xkb.layout = systemSettings.keymap;
  };
  services.cinnamon.apps.enable = true;
  }
