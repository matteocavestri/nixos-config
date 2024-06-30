{ pkgs, ... }:

{
  system.stateVersion = "24.05";
# System Packages
  nixpkgs.config.allowUnfree = true;
  #services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    tmux
    pinentry-gtk2
    gnupg
  ];
}
