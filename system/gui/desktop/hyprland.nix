{pkgs, ...}: {
  imports = [
    ../server/wayland.nix
    ../display/sddm.nix
    ../../security/polkit.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
    };
    systemPackages = with pkgs; [
      libsForQt5.qt5.qtwayland
      qt6.qtwayland
      libinput-gestures
      gsettings-desktop-schemas
      xdg-utils
    ];
    plasma5.excludePackages = [pkgs.kdePackages.systemsettings];
    plasma6.excludePackages = [pkgs.kdePackages.systemsettings];
  };

  xdg.portal.enable = true;

  services = {
    xserver.excludePackages = [pkgs.xterm];
    gvfs.enable = true;
  };
}