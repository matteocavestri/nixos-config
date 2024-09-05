{pkgs, ...}: let
  # My shell aliases
  myAliases = {
    l = "eza -l --icons --git -a";
    lt = "eza --tree --level=2 --long --icons --git";
    ls = "ls --color";
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    neofetch = "fastfetch";
    fetch = "disfetch";
    gitfetch = "onefetch";
  };
in {
  imports = [
    ./cli-collection.nix
    ./zellij.nix
    ./fastfetch.nix
    ./omp.nix
  ];
  # TODO: Edit colors in ls LS_COLORS
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      shellAliases = myAliases;
      initExtra = ''
        # History
        HISTSIZE=5000
        HISTFILE=~/.zsh_history
        SAVEHIST=$HISTSIZE
        HISTDUP=erase
        setopt appendhistory
        setopt sharehistory
        setopt hist_ignore_space
        setopt hist_ignore_all_dups
        setopt hist_save_no_dups
        setopt hist_ignore_dups
        setopt hist_find_no_dups

        # Keybindings
        bindkey -e
        bindkey '^z' history-search-backward
        bindkey '^y' history-search-forward

        # Completion styling
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        # zstyle ':completion:*' list-colors "''${s.:. LS_COLORS}"
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

        # Shell integrations
        eval "$(fzf --zsh)"
        eval "$(zoxide init --cmd cd zsh)"
        eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      '';
    };
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = myAliases;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
