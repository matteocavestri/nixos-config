{pkgs, ...}: {
  # Shell configuration
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    ../minimal-gui/configuration.nix
    ../../system/pkgs/container.nix
    ../../system/pkgs/flatpak.nix
    ../../system/pkgs/virtualization.nix
  ];
}
