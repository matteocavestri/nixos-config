{

  outputs = { nixpkgs, nixos-hardware, home-manager, self, ... }: 
    let
# Your System Settings
      systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos-t2";
        timezone = "Europe/Rome";
        locale = "it_IT.UTF-8";
        keymap = "it";
        profile = "apple-t2"; # only apple-t2
      };
# Your User Settings
      userSettings = {
        username = "matteocavestri";
        name = "Matteo Cavestri";
        mail = "matteo.cavestri@protonmail.ch";
        theme = "catppuccin-mocha"; # Not available
        wm = "gnome"; # only gnome
        font = "Inconsolata Nerd Font";
        fontPkg = "inconsolata-nerdfont";
      };
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { system = systemSettings.system; };
    in {

    nixosConfigurations = {
      ${systemSettings.hostname} = lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.apple-t2
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
          #./profile/apple-t2/configuration.nix
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
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
	      ];
        extraSpecialArgs = {
          inherit userSettings;
          inherit systemSettings;
        };
      };
    };
  };
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
}
