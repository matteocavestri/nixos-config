{
  lib,
  config,
  pkgs,
  ...
}: let
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
    nevica = "nix run github:matteocavestri/nevica#nevica-full";
  };
in {
  options = {
    user.packages.shell = {
      bash.enable = lib.mkEnableOption "Enable bash shell and customizations";
      zsh.enable = lib.mkEnableOption "Enable zsh shell and customizations";
      direnv.enable = lib.mkEnableOption "Enable direnv";
      defaultpkgs = lib.mkEnableOption "Enable defaultpkgs";
    };
  };
  config = {
    # Dependency services
    user.packages = {
      shell = {
        ohmyposh.enable = lib.mkIf config.user.packages.shell.zsh.enable true;
      };
      neofetch.enable = lib.mkIf (config.user.packages.shell.zsh.enable || lib.mkIf config.user.packages.shell.bash.enable) true;
      zellij.enable = lib.mkIf config.user.packages.shell.zsh.enable true;
    };

    programs = {
      # Enable abd configure zsh
      zsh = lib.mkIf config.user.packages.shell.zsh.enable {
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

      # Enable bash shell
      bash = lib.mkIf config.user.packages.shell.bash.enable {
        enable = true;
        enableCompletion = true;
        shellAliases = myAliases;
      };

      # Enable direnv
      direnv = lib.mkIf (config.user.packages.shell.zsh.enable && config.user.packages.shell.direnv.enable) {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };
    };

    # Default packages
    home.packages = with pkgs;
      lib.optionals config.user.packages.shell.defaultpkgs [
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
  };
}
