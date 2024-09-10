{
  pkgs,
  systemSettings,
  lib,
  ...
}: {
  imports = [
    ../../../nixosModules/config/audio.nix
    ../../services/desktop/default.nix
    ../style/stylix.nix
  ];

  system.config.pipewire.enable = lib.mkForce true;
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
