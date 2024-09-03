{
  imports = [
    ../config.nix
    ../../style/qt.nix
  ];
  stylix = {
    targets = {
      xfce.enable = true;
    };
  };
}
