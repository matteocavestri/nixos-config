{ pkgs, ... }:

{
  imports = [
    ../hardware/pipewire.nix
    ./fonts.nix
  ];

  programs.hyprland = {
    enable = true;
    #nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    # Opengl
    graphics.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.systemPackages = with pkgs; [
    waybar
    dunst
    libnotify
    kitty
    alacritty
    rofi-wayland
  ];
}
