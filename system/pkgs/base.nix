{ pkgs, userSettings, ... }:

{
  system.stateVersion = "24.05";
# System Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];
}
