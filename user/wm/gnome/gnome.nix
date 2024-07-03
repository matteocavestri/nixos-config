{ pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
    tmux
    pinentry-gtk2
  ];
  dconf.settings = {
  #   "org/gnome/shell" = {
  #    disable-user-extensions = false;
  #    enabled-extensions = [
  #      "user-theme@gnome-shell-extensions.gcampax.github.com"
  #      "dash-to-dock@micxgx.gmail.com"
  #    ];
  #  };
  };
}
