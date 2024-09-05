{
  imports = [
    ../minimal-gui/configuration.nix
    ../../../system/services/packaging/flatpak.nix
    ../../../system/services/packaging/appimage.nix
    ../../../system/services/virtualization/docker.nix
    ../../../system/services/virtualization/podman.nix
    ../../../system/services/virtualization/distrobox.nix
    ../../../system/services/virtualization/virtualization.nix
  ];
}
