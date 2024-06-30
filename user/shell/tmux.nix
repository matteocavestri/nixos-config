{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    plugins = with pkgs; [
      #tmuxPlugins.catppuccin
      tmuxPlugins.cpu
      tmuxPlugins.vim-tmux-navigator
    ]; 
    extraConfig = ''
    # Tmux general config
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g mouse on
      set -g status-position top
      set -g base-index 1
      set -g pane-base-index 1
      set -g history-limit 1000000
      set -g detach-on-destroy off
      set -g set-clipboard on
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

    # Tmux split window bingings
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

    # Fzf settings
      set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
      set -g @fzf-url-history-limit '2000'

    # Catppuccin Config
      #set -g @catppuccin_flavour 'mocha'
      #set -g @catppuccin_window_left_separator " "
      #set -g @catppuccin_window_right_separator " "
      #set -g @catppuccin_window_middle_separator " █"
      #set -g @catppuccin_window_number_position "right"
      #set -g @catppuccin_window_default_fill "number"
      #set -g @catppuccin_window_current_fill "number"
      #set -g @catppuccin_window_default_text "#W"
      #set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
      #set -g @catppuccin_status_modules_right "directory cpu date_time"
      #set -g @catppuccin_status_modules_left "session"
      #set -g @catppuccin_status_left_separator  " "
      #set -g @catppuccin_status_right_separator " "
      #set -g @catppuccin_status_right_separator_inverse "no"
      #set -g @catppuccin_status_fill "icon"
      #set -g @catppuccin_status_connect_separator "no"
      #set -g @catppuccin_directory_text "#{b:pane_current_path}"
      #set -g @catppuccin_date_time_text "%H:%M"
  '';
  };
}
