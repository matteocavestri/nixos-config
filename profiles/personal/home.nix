{
  pkgs,
  userSettings,
  ...
}: {
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };

  imports = [
    ../../user/shell/sh.nix # Shell config
    (./. + "../../../user/pkgs/browsers" + ("/" + userSettings.browser) + ".nix") # Browser definition
    ../../user/pkgs/flatpak/flatpak.nix # Flatpak config
    ../../user/pkgs/git/git.nix # Git config
    ../../user/pkgs/terminal/nh.nix # nh (nixos/homemanager) config
    ../../user/pkgs/terminal/kitty.nix # Kitty config
    ../../user/pkgs/terminal/alacritty.nix # Alacritty config
    ../../user/pkgs/terminal/lf.nix
    ../../user/pkgs/virtualization/virtualization.nix # Virtualization config
    ../../user/pkgs/editors/nevica.nix # Nevica editor import
    ../../user/pkgs/gaming/gaming.nix
    ../../user/pkgs/engineering/freecad.nix # Engineering pkgs
    ../../user/pkgs/media/kdenlive.nix # Media pkgs
    ../../user/pkgs/media/obs.nix
    ../../user/pkgs/media/mpv.nix
    ../../user/pkgs/basepkgs/productivity.nix # Productivity pkgs
    ../../user/pkgs/basepkgs/tools.nix # tools pkgs
    ../../user/pkgs/graphics/graphics.nix
    (./. + "../../../user/wm" + ("/" + userSettings.wm + "/" + userSettings.wm) + ".nix") # Window manager import

    ../../user/lang/cc.nix
    ../../user/lang/go.nix
    ../../user/lang/lua.nix
    ../../user/lang/rust.nix
    ../../user/lang/python.nix
    ../../user/lang/javascript.nix
    ../../user/lang/java.nix
  ];
}