{
  pkgs,
  systemSettings,
  lib,
  ...
}: {
  imports = [
    ../../../nixosModules/config/default.nix
    ../../../nixosModules/services/default.nix
    ../../services/desktop/default.nix
    ../style/stylix.nix
  ];

  # Setup requirements
  system = {
    config.pipewire.enable = lib.mkForce true;
    services = {
      dbus.enable = lib.mkForce true;
      dconf.enable = lib.mkForce true;
      gvfs.enable = lib.mkForce true;
    };
  };

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
