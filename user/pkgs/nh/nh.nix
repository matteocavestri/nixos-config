{ config, pkgs, userSettings, ... }:
{
  home.packages = with pkgs; [
    nh
  ];
  home.sessionVariables = {
    FLAKE = "$HOME/${userSettings.dotfilesDir}";
  };
}
