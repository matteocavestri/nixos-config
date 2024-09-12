{
  pkgs,
  systemSettings,
  lib,
  config,
  ...
}: {
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

        # Configure keymap
        xkb.layout = systemSettings.host.keymap;
      };

      # Disable touchpad while typing
      libinput = {
        touchpad.disableWhileTyping = true;
      };
    };

    # Enable clipboard
    environment.systemPackages = with pkgs; [
      xclip
    ];
  };
}
