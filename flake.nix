{
  nixConfig = {
    extra-substituters = [
      # "https://hydra.soopy.moe"
      "https://cache.soopy.moe" # toggle these if this one doesn't work.
    ];
    extra-trusted-public-keys =
      [ "hydra.soopy.moe:IZ/bZ1XO3IfGtq66g+C85fxU/61tgXLaJ2MlcGGXU8Q=" ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { nixpkgs, nixos-hardware, ... }: 
    let
      lib = nixpkgs.lib;
    in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-classic;
    nixosConfigurations.nixos-t2 = lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./nix/substituter.nix
        nixos-hardware.nixosModules.apple-t2
      ];
    };
  };
}
