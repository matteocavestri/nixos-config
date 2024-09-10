{
  systemSettings,
  pkgs,
  ...
}: {
  system.services.wayland.enable = true;

  services = {
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6 = {
      enable = true;
    };
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
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    ark
    elisa
    gwenview
    okular
    kate
    dolphin
    dolphin-plugins
    ffmpegthumbs
    khelpcenter
  ];
}
