{systemSettings, ...}: {
  imports = [
    ../server/wayland.nix
  ];
  services = {
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      xkb.layout = systemSettings.host.keymap;
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
