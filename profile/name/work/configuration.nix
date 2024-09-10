{
  imports = [
    ../minimal-gui/configuration.nix
    ../../../nixosModules/virtualisation/default.nix

    # ../../../system/services/packaging/appimage.nix
  ];

  system = {
    virtualisation = {
      qemu = {
        enable = true;
        winsupport = true;
      };
      docker.enable = true;
      podman.enable = true;
      distrobox.enable = true;
    };
    packages.packaging.appimage.enable = true;
  };
}
