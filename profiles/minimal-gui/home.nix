{userSettings, ...}: {
  imports = [
    ../minimal/home.nix
    (./. + "../../../user/pkgs/browsers" + ("/" + userSettings.browser) + ".nix") # Browser definition
    (./. + "../../../user/wm" + ("/" + userSettings.wm + "/" + userSettings.wm) + ".nix") # Window manager import
  ];
}
