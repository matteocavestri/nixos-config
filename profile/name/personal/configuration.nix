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
      printing = {
        enable = true;
        autodiscovery = true;
      };
    };
    virtualisation = {
      qemu = {
        enable = true;
        winsupport = true;
      };
      wine = {
        enable = true;
        support32 = true;
      };
      waydroid.enable = true;
      docker.enable = true;
      podman.enable = true;
      distrobox.enable = true;
    };
    packages = {
      steam.enable = true;
      packaging = {
        appimage.enable = true;
        flatpak.enable = true;
      };
    };
  };
}
