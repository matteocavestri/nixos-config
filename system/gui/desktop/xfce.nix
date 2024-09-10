{...}: {
  imports = [
    ../display/lightdm.nix
  ];
  system.services.xorg.enable = true;
  # if you use pulseaudio
  nixpkgs.config.pulseaudio = true;

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };
}
