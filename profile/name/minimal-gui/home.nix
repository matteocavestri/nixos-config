{userSettings, ...}: {
  imports = [
    ../minimal/home.nix
    (./. + "../../../../user/packages/browsers" + ("/" + userSettings.environment.browser) + ".nix") # Browser definition
    (./. + "../../../../user/gui" + ("/" + userSettings.wm + "/" + userSettings.wm) + ".nix") # Window manager import
  ];

  user = {
    packages = {
      flatpak = {
        enable = true;
        customizations = true;
      };
      kitty.enable = true;
    };
  };
}
