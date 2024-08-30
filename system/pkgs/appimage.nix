{pkgs, ...}: {
  # Appimage support
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  environment.systemPackages = with pkgs; [
    libappimage
    appimage-run
    appimagekit
  ];
}
