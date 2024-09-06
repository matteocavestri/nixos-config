{userSettings, ...}: {
  imports = [
    ../minimal/configuration.nix
    ../../../system/security/default-gui.nix
    ../../../system/services/packaging/flatpak.nix
    (./. + "../../../../system/gui/desktop" + ("/" + userSettings.wm) + ".nix")
  ];
}
