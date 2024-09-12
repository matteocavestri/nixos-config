{userSettings, ...}: {
  imports = [
    ../minimal/configuration.nix
    (./. + "../../../../nixosModules/desktop" + ("/" + userSettings.wm) + ".nix")
  ];

  system = {
    security = {
      sudors.enable = true;
      gnome-keyring.enable = true;
    };
    services = {
      dconf.enable = true;
      dbus.enable = true;
      gvfs.enable = true;
      online-accounts.enable = true;
    };
    virtualisation = {
      qemu = {
        enable = true;
        winsupport = true;
      };
      docker.enable = true;
      podman.enable = true;
      distrobox.enable = true;
    };
    packages.packaging = {
      appimage.enable = true;
      flatpak.enable = true;
    };
  };
}
