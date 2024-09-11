{
  imports = [
    ../config.nix
  ];
  user.services.qtstyle.enable = true;
  stylix = {
    targets = {
      xfce.enable = true;
    };
  };
}
