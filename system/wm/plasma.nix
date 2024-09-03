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
  systemd.services."app-pulseaudio@autostart" = {
    enable = false;
  };
}
