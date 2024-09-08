{
  inputs,
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ../config.nix
    ./top-panel.nix
    ./dock.nix
    ./krunner.nix
    ./shortcuts.nix
  ];
  home.packages = with pkgs; [
    libsForQt5.qt5.qtbase
    kdePackages.qtbase
    kdePackages.qtwayland
    libsForQt5.qt5.qtwayland
  ];
  programs.plasma = {
    enable = true;
    kwin = {
      #edgeBarrier = 0; # Disables the edge-barriers introduced in plasma 6.1 (nixpkgs >= 24.11)
      effects = {
        dimAdminMode.enable = true;
        minimization.animation = "magiclamp";
        slideBack.enable = true;
        wobblyWindows.enable = true;
        desktopSwitching.animation = "slide";
        windowOpenClose.animation = "glide";
      };
      cornerBarrier = false;
      scripts.polonium.enable = false; # nixpkgs >= 24.11
      virtualDesktops = {
        rows = 2;
        number = 8;
      };
    };
    workspace.iconTheme = userSettings.appearance.icons;
    kscreenlocker = {
      lockOnResume = true;
      timeout = 10;
    };
  };
}
