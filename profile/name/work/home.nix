{
  imports = [
    ../minimal-gui/home.nix
    ../../../user/packages/virtualization/virtualization.nix
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
      gimp.enable = true;
      kdenlive.enable = true;
      obs.enable = true;
      mediatools.enable = true;
      libreoffice.enable = true;
      nextcloud-client.enable = true;
      protonmail-bridge.enable = true;
    };
  };
}
