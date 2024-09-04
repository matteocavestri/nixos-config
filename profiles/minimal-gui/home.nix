{userSettings, ...}: {
  imports = [
    ../minimal/home.nix
    ../../user/pkgs/terminal/kitty.nix
    (./. + "../../../user/pkgs/browsers" + ("/" + userSettings.environment.browser) + ".nix") # Browser definition
    (./. + "../../../user/wm" + ("/" + userSettings.wm + "/" + userSettings.wm) + ".nix") # Window manager import
  ];
}
