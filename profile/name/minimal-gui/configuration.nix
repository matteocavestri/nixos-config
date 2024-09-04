{userSettings, ...}: {
  imports = [
    ../minimal/configuration.nix
    ../../../system/security/default-gui.nix
    (./. + "../../../../system/gui/desktop" + ("/" + userSettings.wm) + ".nix")
  ];
}
