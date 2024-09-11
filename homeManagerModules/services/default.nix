{lib, ...}: {
  imports = [
    ./styling.nix
  ];
  user.services = {
    stylix.enable = lib.mkDefault false;
    gtkstyle.enable = lib.mkDefault false;
    qtstyle.enable = lib.mkDefault false;
  };
}
