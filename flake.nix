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
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, ... }: 
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "matteocavestri";
    in {
    nixosConfigurations = {
# nixos-t2 configuration
      nixos-t2 = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/configuration.nix
          ./nix/substituter.nix
          nixos-hardware.nixosModules.apple-t2
          ./system/wm/gnome/gnome.nix
        ];
      };
    };
    homeConfigurations = {
# matteocavestri configuration --> home-manager
      matteocavestri = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
	        ./user/home.nix
	        ./user/app/terminal/alacritty.nix
	        ./user/shell/sh.nix
          ./user/shell/cli-collection.nix
          ./user/app/editor/neovim.nix
          ./user/lang/cc.nix
          ./user/lang/python.nix
          ./user/lang/rust.nix
          ./user/lang/javascript.nix
          ./user/lang/go.nix
          ./user/lang/lua.nix
	      ];
      };
    };
  };
}
