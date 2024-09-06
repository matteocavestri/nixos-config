{userSettings, ...}: {
  imports = [
    ../minimal/home.nix
    ../../../user/packages/terminal/kitty.nix
    ../../../user/packages/flatpak/flatpak.nix
    (./. + "../../../../user/packages/browsers" + ("/" + userSettings.environment.browser) + ".nix") # Browser definition
    (./. + "../../../../user/gui" + ("/" + userSettings.wm + "/" + userSettings.wm) + ".nix") # Window manager import
  ];
}
