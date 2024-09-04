{
  imports = [
    ../minimal-gui/home.nix
    ../../../user/packages/flatpak/flatpak.nix # Flatpak config
    ../../../user/packages/virtualization/virtualization.nix # Virtualization config
    ../../../user/packages/editors/nevica.nix # Nevica editor import
    ../../../user/packages/gaming/gaming.nix
    ../../../user/packages/gaming/gaming-proton.nix
    ../../../user/packages/engineering/freecad.nix # Engineering packages
    ../../../user/packages/engineering/octave.nix
    ../../../user/packages/media/kdenlive.nix # Media packages
    ../../../user/packages/media/gimp.nix
    ../../../user/packages/media/obs.nix
    ../../../user/packages/media/mpv.nix
    ../../../user/packages/productivity/libreoffice.nix
    ../../../user/packages/productivity/productivity.nix
    ../../../user/packages/productivity/groupware.nix
    ../../../user/packages/productivity/thunderbird.nix
    ../../../user/packages/media/graphics-tools.nix
  ];
}
