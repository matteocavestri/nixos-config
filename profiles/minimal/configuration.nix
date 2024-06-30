{ pkgs, userSettings, ... }:

{
# Shell configuration
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

 imports = [
# Hardware
  ../../system/hardware/locale.nix
  ../../system/hardware/networking.nix
  ../../system/hardware/systemdboot.nix
  ../../system/hardware-configuration.nix
# Security
  ../../system/security/gpg.nix
  ../../system/security/users.nix
 ]; 
}
