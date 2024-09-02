{systemSettings, ...}: {
  imports = [
    ./servers/wayland.nix
    ../services/dconf.nix
  ];
  services = {
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      xkb.layout = systemSettings.keymap;
    };
  };
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
