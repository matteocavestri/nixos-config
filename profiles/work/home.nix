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
    ../../user/pkgs/editors/nevica.nix # Nevica editor import
    ../../user/pkgs/basepkgs/productivity.nix # Productivity pkgs
    ../../user/pkgs/virtualization/virtualization.nix
    ../../user/pkgs/flatpak/flatpak.nix
    ../../user/pkgs/engineering/freecad.nix
    ../../user/pkgs/engineering/octave.nix
    # ../../user/pkgs/media/obs.nix
    ../../user/pkgs/media/kdenlive.nix
    ../../user/pkgs/media/gimp.nix
  ];
}
