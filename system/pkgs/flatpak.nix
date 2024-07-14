{pkgs, ...}: {
  # Need some flatpaks
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  # Appimage support
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
