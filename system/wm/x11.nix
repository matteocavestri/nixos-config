{
  pkgs,
  systemSettings,
  ...
}: {
  imports = [
    ../hardware/pipewire.nix
    ../config/fonts.nix
  ];

  # Configure X11
  services.xserver = {
    enable = true;
    excludePackages = [pkgs.xterm];
    xkb.layout = systemSettings.keymap;
    displayManager = {
      lightdm.enable = true;
    };
    libinput = {
      touchpad.disableWhileTyping = true;
    };
  };
  # Configure dbus
  services.dbus = {
    enable = true;
    packages = [pkgs.dconf];
  };

  programs.dconf = {
    enable = true;
  };

  # Configure Gnome keyring
  services.gnome = {
    gnome-keyring.enable = true;
  };
}
