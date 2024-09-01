{userSettings, ...}: {
  imports = [
    (./. + "../../../system/wm" + ("/" + userSettings.wm) + ".nix")
    ../minimal/configuration.nix
    ../../system/hardware/pipewire.nix
    ../../system/style/stylix.nix
  ];
}
