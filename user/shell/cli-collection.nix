{pkgs, ...}: {
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    disfetch
    onefetch
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
    pandoc
    hwinfo
    pciutils
    numbat
    pass
    direnv
    nix-direnv
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
