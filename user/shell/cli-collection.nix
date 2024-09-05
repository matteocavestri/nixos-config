{pkgs, ...}: {
  # Collection of useful CLI apps
  home.packages = with pkgs; [
    disfetch
    onefetch
    killall
    timer
    gnugrep
    gnused
    bat
    eza
    fd
    bc
    bottom
    btop
    ripgrep
    fzf
    lazygit
    lazydocker
    zoxide
    oh-my-posh
    tree-sitter
    rsync
    unzip
    pandoc
    hwinfo
    pciutils
    direnv
    nix-direnv
  ];
}
