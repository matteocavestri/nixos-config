{userSettings, ...}: {
  home = {
    username = userSettings.username;
    homeDirectory = "/home/" + userSettings.username;
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = userSettings.editor;
      TERM = userSettings.term;
      BROWSER = userSettings.browser;
    };
  };

  programs.home-manager.enable = true;

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
    ../../user/pkgs/engineering/octave.nix
    ../../user/pkgs/media/kdenlive.nix # Media pkgs
    ../../user/pkgs/media/obs.nix
    ../../user/pkgs/media/mpv.nix
    ../../user/pkgs/basepkgs/productivity.nix # Productivity pkgs
    ../../user/pkgs/basepkgs/tools.nix # tools pkgs
    ../../user/pkgs/graphics/graphics.nix
    (./. + "../../../user/wm" + ("/" + userSettings.wm + "/" + userSettings.wm) + ".nix") # Window manager import

    ../../user/pkgs/coding/compiler.nix
    ../../user/pkgs/coding/tools.nix
  ];
}
