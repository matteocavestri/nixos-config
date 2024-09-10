{userSettings, ...}: {
  imports = [
    ../minimal/configuration.nix
    ../../../nixosModules/services/default.nix
    (./. + "../../../../system/gui/desktop" + ("/" + userSettings.wm) + ".nix")
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
    packages.packaging.flatpak.enable = true;
  };
}
