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
  ];
  home.packages = with pkgs; [
    gnome.gnome-calendar
    gnome.nautilus
  ];
  programs.plasma = {
    enable = true;
    kwin = {
      #edgeBarrier = 0; # Disables the edge-barriers introduced in plasma 6.1 (nixpkgs >= 24.11)
      effects.shakeCursor.enable = true;
      cornerBarrier = false;
      scripts.polonium.enable = false; # nixpkgs >= 24.11
      virtualDesktops = {
        rows = 2;
        number = 8;
      };
    };
    workspace.iconTheme = userSettings.icons;
    powerdevil = {
      AC = {
        powerButtonAction = "lockScreen";
        autoSuspend.action = "nothing";
        dimDisplay.enable = false;
        turnOffDisplay.idleTimeout = "never";
        whenLaptopLidClosed = "doNothing";
      };
      battery = {
        powerButtonAction = "lockScreen";
        autoSuspend.action = "nothing";
        dimDisplay.enable = false;
        turnOffDisplay.idleTimeout = "never";
        whenLaptopLidClosed = "doNothing";
      };
      lowBattery = {
        powerButtonAction = "lockScreen";
        autoSuspend.action = "nothing";
        dimDisplay.enable = false;
        turnOffDisplay.idleTimeout = "never";
        whenLaptopLidClosed = "doNothing";
      };
    };
    kscreenlocker = {
      lockOnResume = true;
      timeout = 10;
    };
    shortcuts = {
      kwin = {
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Switch to Desktop 6" = "Meta+6";
        "Switch to Desktop 7" = "Meta+7";
        "Switch to Desktop 8" = "Meta+8";
        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+%";
        "Window to Desktop 6" = "Meta+^";
        "Window to Desktop 7" = "Meta+&";
        "Window to Desktop 8" = "Meta+*";
      };
    };
  };
}
