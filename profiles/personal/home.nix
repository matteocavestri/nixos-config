{
  imports = [
    ../minimal-gui/home.nix
    ../../user/pkgs/flatpak/flatpak.nix # Flatpak config
    ../../user/pkgs/virtualization/virtualization.nix # Virtualization config
    ../../user/pkgs/editors/nevica.nix # Nevica editor import
    ../../user/pkgs/gaming/gaming.nix
    ../../user/pkgs/engineering/freecad.nix # Engineering pkgs
    ../../user/pkgs/engineering/octave.nix
    ../../user/pkgs/media/kdenlive.nix # Media pkgs
    ../../user/pkgs/media/gimp.nix
    ../../user/pkgs/media/obs.nix
    ../../user/pkgs/media/mpv.nix
    ../../user/pkgs/productivity/productivity.nix
    ../../user/pkgs/media/graphics-tools.nix
  ];
}
