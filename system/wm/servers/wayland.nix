{
  pkgs,
  systemSettings,
  ...
}: {
  imports = [
    ../../hardware/pipewire.nix
    ../../config/fonts.nix
  ];
  # Configure wayland
  environment.systemPackages = with pkgs; [
    wayland
  ];

  # Configure xwayland
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = systemSettings.keymap;
        variant = "";
        options = "caps:escape";
      };
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
