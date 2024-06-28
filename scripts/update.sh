#!/bin/sh

cd $HOME/.dotfiles/
nix flake update && \
  sudo nixos-rebuild switch --flake .#nixos-t2 && \
  home-manager switch --flake .#matteocavestri
