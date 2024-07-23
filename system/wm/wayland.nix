{
  config,
  pkgs,
  systemSettings,
  ...
}: {
  imports = [
    ../hardware/pipewire.nix
    ../config/fonts.nix
  ];
  # Configure wayland
  environment.systemPackages = with pkgs; [
    wayland
    (sddm-chili-theme.override {
      themeConfig = {
        background = config.stylix.image;
        ScreenWidth = 1536;
        ScreenHeight = 960;
        blur = true;
        recursiveBlurLoops = 3;
        recursiveBlurRadius = 5;
      };
    })
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = systemSettings.keymap;
      variant = "";
      options = "caps:escape";
    };
  };

  # Configure display display manager
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      theme = "chili";
      package = pkgs.sddm;
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
