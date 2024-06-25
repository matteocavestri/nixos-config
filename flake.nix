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

  outputs = { nixpkgs, nixos-hardware, home-manager, self, ... }: 
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos-t2";
        timezone = "Europe/Rome";
        locale = "it_IT.UTF-8";
      };
      userSettings = {
        username = "matteocavestri";
      };
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { system = systemSettings.system; };
      #pkgs = nixpkgs.legacyPackages.system.${systemSetting.system};
    in {

    nixosConfigurations = {
      nixos-t2 = lib.nixosSystem {
        modules = [
          #./system/configuration.nix
          #./system/hardware/substituter-t2.nix
          nixos-hardware.nixosModules.apple-t2
          #./system/wm/gnome.nix
          #./system/wm/fonts.nix
          #./system/hardware/pipewire.nix
          #./system/hardware/touchpad.nix
          #./system/hardware/networking-t2.nix
          #./system/hardware/locale.nix
          #./system/security/gpg.nix
          ./profile/apple-t2/configuration.nix
        ];
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
        };
      };
    };

    homeConfigurations = {
      ${userSettings.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./profile/apple-t2/home.nix
	        #./user/home.nix
	        #./user/app/terminal/alacritty.nix
	        #./user/shell/sh.nix
          #./user/shell/cli-collection.nix
          #./user/app/editor/neovim.nix
          #./user/lang/cc.nix
          #./user/lang/python.nix
          #./user/lang/rust.nix
          #./user/lang/javascript.nix
          #./user/lang/go.nix
          #./user/lang/lua.nix
	      ];
        extraSpecialArgs = {
          inherit userSettings;
          inherit systemSettings;
        };
      };
    };
  };
}
