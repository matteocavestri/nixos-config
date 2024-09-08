{pkgs, ...}: {
  home = {
    packages = [
      pkgs.flatpak
      pkgs.gnome.gnome-software
    ];
    sessionVariables = {
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"; # lets flatpak work
    };
  };
}
