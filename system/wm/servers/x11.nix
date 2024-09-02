{
  pkgs,
  systemSettings,
  ...
}: {
  imports = [
    ../../hardware/pipewire.nix
    ../../config/fonts.nix
    ../../services/dconf.nix
  ];
  # Configure X11
  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      xkb.layout = systemSettings.keymap;
    };
    libinput = {
      touchpad.disableWhileTyping = true;
    };
  };
  environment.systemPackages = with pkgs; [
    xclip
  ];
}
