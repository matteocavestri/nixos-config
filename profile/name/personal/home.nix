{
  imports = [
    ../work/home.nix
    ../../../user/packages/security/termshark.nix
  ];

  user = {
    packages = {
      obs.withplugins = true;
      minecraft.enable = true;
      gamemode.enable = true;
      mangohud.enable = true;
      lutris.enable = true;
      heroic.enable = true;
    };
    virtualisation.wine = {
      enable = true;
      bottles = true;
      protonDir = true;
    };
  };
}
