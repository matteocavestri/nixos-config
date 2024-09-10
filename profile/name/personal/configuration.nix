{
  imports = [
    ../work/configuration.nix
    ../../../system/services/transemu/waydroid.nix
  ];

  system = {
    virtualisation = {
      wine = {
        enable = true;
        support32 = true;
      };
    };
  };
}
