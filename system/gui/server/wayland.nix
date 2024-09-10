{
  pkgs,
  systemSettings,
  lib,
  ...
}: {
  imports = [
    ../../../nixosModules/config/default.nix
    ../../../nixosModules/services/default.nix
    # ../../services/desktop/default.nix
    ../style/stylix.nix
  ];
  # Enable required modules
  system = {
    config.pipewire.enable = lib.mkForce true;
    services = {
      dbus.enable = lib.mkForce true;
      dconf.enable = lib.mkForce true;
      gvfs.enable = lib.mkForce true;
    };
  };

  # Configure wayland
  environment = {
    systemPackages = with pkgs; [
      wayland
      wl-clipboard
      wl-clipboard-x11
      xwaylandvideobridge
      wayland-utils
    ];
    sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_BACKEND = "wayland";
      NIXOS_OZONE_WL = "1";
      GDK_BACKEND = "wayland,x11,*";
      QT_QPA_PLATFORM = "wayland;xcb";
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };

  # Configure xwayland
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = systemSettings.host.keymap;
        variant = "";
        # options = "caps:escape"; # Useful for vim
      };
    };
  };
}
