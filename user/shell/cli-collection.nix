{ pkgs, ... }:
{
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    # Command Line
    disfetch 
    lolcat 
    cowsay
    onefetch
    starfetch
    cava
    killall
    libnotify
    timer
    brightnessctl
    gnugrep
    gnused
    bat 
    eza 
    fd 
    bc
    bottom 
    ripgrep
    fzf
    tree-sitter
    rsync
    unzip
    w3m
    pandoc
    hwinfo
    pciutils
    numbat
    pass
    wl-clipboard-x11
    direnv
    nix-direnv
    tmux
    (pkgs.writeShellScriptBin "airplane-mode" ''
      #!/bin/sh
      connectivity="$(nmcli n connectivity)"
      if [ "$connectivity" == "full" ]
      then
          nmcli n off
      else
          nmcli n on
      fi
    '')
  ];
}
