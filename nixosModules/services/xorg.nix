{
  pkgs,
  systemSettings,
  lib,
  config,
  ...
}: {
  imports = [
    ../../system/gui/style/stylix.nix
  ];

  options = {
    system.services.xorg.enable = lib.mkEnableOption "Enable Xorg Server";
  };

  config = lib.mkIf config.system.services.xorg.enable {
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
  };
}
