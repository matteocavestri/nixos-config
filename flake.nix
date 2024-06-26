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
        email = "matteo.cavestri@protonmail.ch";
        theme = "catppuccin-mocha"; # Not available
        wm = "hyprland"; # only gnome
        font = "Inconsolata Nerd Font";
        fontPkg = "inconsolata-nerdfont";
        term = "kitty";
        browser = "firefox";
      };
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { system = systemSettings.system; };
    in {

    nixosConfigurations = {
      ${systemSettings.hostname} = lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.apple-t2
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
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
    
    hyprland.url = "github:hyprwm/Hyprland";
    #plugin_name = {
    #  url = "github:hyprwm/hyprland-plugins/151102b7d7c4f61ff42f275e72008d28318dac96";
    #  inputs.hyprland.follows = "hyprland";
    #};

    #hyprland = {
    #  type = "git";
    #  url = "https://github.com/hyprwm/Hyprland";
    #  submodules = true;
    #  rev = "ea2501d4556f84d3de86a4ae2f4b22a474555b9f";
    #};
    #hyprland.inputs.nixpkgs.follows = "nixpkgs";
    #hyprland-plugins.url = "github:hyprwm/hyprland-plugins/151102b7d7c4f61ff42f275e72008d28318dac96";
    #hyprland-plugins.inputs.hyprland.follows = "hyprland";
    #hycov.url = "github:DreamMaoMao/hycov/3d144a79f8b5468656de88a005be55f3317d295b";
    #hycov.inputs.hyprland.follows = "hyprland";
  };
}
