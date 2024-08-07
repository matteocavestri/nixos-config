{
  # Need some flatpaks
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  # Appimage support
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
