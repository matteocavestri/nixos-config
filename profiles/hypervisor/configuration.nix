{pkgs, ...}: {
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    ../minimal/configuration.nix
    ../../system/pkgs/container.nix
    ../../system/pkgs/virtualization.nix
    ../../system/services/openssh.nix
    ../../system/services/cockpit.nix
  ];
}
