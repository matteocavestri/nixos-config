{
  imports = [
    ../minimal-gui/home.nix
    ../../../user/packages/virtualization/virtualization.nix
    ../../../user/packages/productivity/libreoffice.nix
    ../../../user/packages/productivity/groupware.nix
    ../../../user/packages/media/kdenlive.nix
    ../../../user/packages/media/gimp.nix
    ../../../user/packages/media/graphics-tools.nix
    ../../../user/packages/media/obs-minimal.nix
  ];

  user = {
    packages = {
      nevica = {
        enable = true;
      };
      langs = {
        go.enable = true;
        jvm.enable = true;
        web.enable = true;
        lua.enable = true;
        rust.enable = true;
        zig.enable = true;
        python.enable = true;
      };
      freecad.enable = true;
      kicad.enable = true;
      numbat.enable = true;
      octave.enable = true;
    };
  };
}
