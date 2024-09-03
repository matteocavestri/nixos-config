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
  systemd.user.services."app-pulseaudio@autostart" = {
    enable = false;
    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/true";
      Type = "oneshot";
    };
  };
}
