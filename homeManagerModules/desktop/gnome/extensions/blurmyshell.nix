{pkgs, ...}: {
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
  ];
  dconf = {
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        ];
      };
      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.60;
        noise-amount = 0;
      };
      "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
        brightness = 0.60;
        sigma = 30;
      };
      "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
        blur = true;
        brightness = 0.60;
        sigma = 30;
      };
      "org/gnome/shell/extensions/blur-my-shell/panel" = {
        brightness = 0.60;
        sigma = 30;
      };
      "org/gnome/shell/extensions/blur-my-shell/window-list" = {
        brightness = 0.60;
        sigma = 30;
      };
    };
  };
}
