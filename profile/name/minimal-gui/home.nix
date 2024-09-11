{userSettings, ...}: {
  imports = [
    ../minimal/home.nix
    ../../../homeManagerModules/services/default.nix
    (./. + "../../../../homeManagerModules/desktop" + ("/" + userSettings.wm + "/" + userSettings.wm) + ".nix") # Window manager import
  ];

  user = {
    packages = {
      flatpak = {
        enable = true;
        customizations = true;
      };
      kitty.enable = true;
      shell.zsh.enable = true;
      zellij.enable = true;
      firefox.enable = true;
    };
  };
}
