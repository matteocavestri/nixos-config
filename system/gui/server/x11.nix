{
  pkgs,
  systemSettings,
  ...
}: {
  imports = [
    ../../config/hardware/pipewire.nix
    ../../services/desktop/default.nix
    ../style/stylix.nix
  ];
  # Configure X11
  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      xkb.layout = systemSettings.host.keymap;
    };
    libinput = {
      touchpad.disableWhileTyping = true;
    };
  };
  environment.systemPackages = with pkgs; [
    xclip
  ];
}
