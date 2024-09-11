{pkgs, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    config = {
      terminal = "kitty";
      modifier = "Mod4";
    };
  };
}
