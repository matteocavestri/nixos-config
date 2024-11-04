{pkgs, ...}: {
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
  ];
  dconf = {
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          pkgs.gnomeExtensions.dash-to-dock.extensionUuid
        ];
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = true;
        dock-position = "BOTTOM";
        background-opacity = 0.60;
        dash-max-icon-size = 32;
        height-fraction = 0.90;
      };
    };
  };
}
