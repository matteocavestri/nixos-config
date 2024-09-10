{
  lib,
  config,
  ...
}: {
  # Dependency services
  system.services = {
    xorg.enable = true;
    displayManager.lightdm.enable = true;
  };

  # if you use pulseaudio
  nixpkgs.config.pulseaudio = lib.mkIf config.system.config.audio.pulseaudio.enable true;

  # Enable Xfce desktop environment
  services.xserver = {
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };
}
