{ config, pkgs, lib, ... }:

with lib;
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
    }];
  };
}
