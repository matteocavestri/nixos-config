{ ... }:

{
  imports = [ 
# Apps imports
    #../../user/apps/editors/neovim.nix
    ./apps/editors/neve.nix
    ./apps/git/git.nix
    ./apps/terminal/kitty.nix
    ./apps/terminal/alacritty.nix
    ./apps/ranger/ranger.nix
# Shell and CLI imports
    ./shell/sh.nix
    ./shell/cli-collection.nix
    ./shell/tmux.nix
  ];
}
