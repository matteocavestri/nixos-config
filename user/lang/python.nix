{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      python3Full
      pipx
  ];
}
