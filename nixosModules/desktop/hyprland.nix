{
  pkgs,
  lib,
  ...
}: {
  # Dependency services
  system = {
    security.polkit.enable = lib.mkForce true;
    services = {
      wayland.enable = true;
      displaymanager.sddm.enable = true;
    };
  };

  # Enable Hyprland Window manager and xdg desktop portal hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  # Setup environment variables for hyprland
  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
    };

    # Install dependencies for hyprland
    systemPackages = with pkgs; [
      libsForQt5.qt5.qtwayland
      qt6.qtwayland
      libinput-gestures
      gsettings-desktop-schemas
      xdg-utils
    ];

    # exclude packages from kde
    plasma5.excludePackages = [pkgs.kdePackages.systemsettings];
    plasma6.excludePackages = [pkgs.kdePackages.systemsettings];
  };
}
