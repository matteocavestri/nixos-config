{ pkgs, ... }:

{
# Shell configuration
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

 imports = [
# Default import
  ../../system/config.nix
# Hardware
  ../../system/hardware/systemdboot.nix
 ]; 
}
