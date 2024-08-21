{systemSettings, ...}: {
  services = {
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      xkb.layout = systemSettings.keymap;
    };
  };
  programs.dconf.enable = true;
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
