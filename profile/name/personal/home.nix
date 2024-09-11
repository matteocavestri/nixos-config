{
  imports = [
    ../work/home.nix
    # ../../../user/packages/media/obs.nix
    ../../../user/packages/gaming/gaming.nix
    ../../../user/packages/gaming/gaming-proton.nix
    ../../../user/packages/security/termshark.nix
  ];

  user = {
    packages.obs.withplugins = true;
  };
}
