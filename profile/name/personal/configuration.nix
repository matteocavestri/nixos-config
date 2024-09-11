{
  imports = [
    ../work/configuration.nix
  ];

  system = {
    virtualisation = {
      wine = {
        enable = true;
        support32 = true;
      };
      waydroid.enable = true;
    };
    packages.steam.enable = true;
  };
}
