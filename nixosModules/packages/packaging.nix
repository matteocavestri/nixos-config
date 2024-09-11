{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.packages.packaging = {
      flatpak.enable = lib.mkEnableOption "Enable flatpak support";
      appimage.enable = lib.mkEnableOption "Enable appimage support";
    };
  };
  config = {
    # Enable flatpak support
    services.flatpak.enable = lib.mkIf config.system.packages.packaging.flatpak.enable true;
    xdg.portal.enable = lib.mkIf config.system.packages.packaging.flatpak.enable true;

    # Add flatpak remotes
    systemd.services = lib.mkIf config.system.packages.packaging.flatpak.enable {
      flatpak-repo = {
        wantedBy = ["multi-user.target"];
        path = [pkgs.flatpak];
        script = ''
          flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
          flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo && \
          flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo && \
          flatpak remote-add --if-not-exists rhel https://flatpaks.redhat.io/rhel.flatpakrepo
        '';
      };
    };

    # Enable appimage support
    programs.appimage = lib.mkIf config.system.packages.packaging.appimage.enable {
      enable = true;
      binfmt = true;
    };
    environment = lib.mkIf config.system.packages.packaging.appimage.enable {
      systemPackages = with pkgs; [
        libappimage
        appimage-run
        appimagekit
      ];
    };
  };
}
