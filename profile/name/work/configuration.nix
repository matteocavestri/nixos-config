{
  imports = [
    ../minimal-gui/configuration.nix
    ../../../nixosModules/virtualisation/default.nix

    ../../../system/services/packaging/appimage.nix
    ../../../system/services/virtualization/docker.nix
    ../../../system/services/virtualization/podman.nix
    ../../../system/services/virtualization/distrobox.nix
  ];

  system = {
    virtualisation = {
      qemu = {
        enable = true;
        winsupport = true;
      };
    };
  };
}
