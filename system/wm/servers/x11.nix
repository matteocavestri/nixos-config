{
  pkgs,
  systemSettings,
  ...
}: {
  imports = [
    ../../hardware/pipewire.nix
    ../../config/fonts.nix
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
    dbus = {
      enable = true;
      packages = [pkgs.dconf];
    };
    gnome = {
      gnome-keyring.enable = true;
    };
  };

  programs.dconf = {
    enable = true;
  };
}
