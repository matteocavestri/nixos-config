{
  imports = [
    ./hardware-configuration.nix
  ];
  system = {
    config = {
      zram.enable = true;
      unfree.enable = true;
    };
  };
}
