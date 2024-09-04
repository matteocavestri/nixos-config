{
  imports = [
    ../minimal-gui/configuration.nix

    ../../../system/services/packaging/flatpak.nix
    ../../../system/services/packaging/appimage.nix
    ../../../system/services/virtualization/container.nix
    ../../../system/services/virtualization/virtualization.nix
    ../../../system/services/transemu/wine.nix
    ../../../system/services/transemu/waydroid.nix
    ../../../system/packages/steam.nix
  ];
}
