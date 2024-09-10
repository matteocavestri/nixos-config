{userSettings, ...}: {
  imports = [
    ../minimal/configuration.nix
    ../../../system/services/packaging/flatpak.nix
    (./. + "../../../../system/gui/desktop" + ("/" + userSettings.wm) + ".nix")
  ];

  system = {
    security = {
      sudors.enable = true;
      gnome-keyring.enable = true;
    };
  };
}
