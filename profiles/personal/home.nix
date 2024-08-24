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
    ../minimal-gui/home.nix
    ../../user/pkgs/flatpak/flatpak.nix # Flatpak config
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
  ];
}
