{

  outputs = inputs@{ nixpkgs, nixos-hardware, home-manager, self, stylix, ... }: 
    let
# -------------------- SYSTEM SETTINGS ------------------------------
      systemSettings = {
        system = "x86_64-linux"; # Your arch 
        hostname = "nixos-t2"; # Your hostname (fix scripts)
        timezone = "Europe/Rome"; # Timezone config
        locale = "it_IT.UTF-8"; # Locale config
        keymap = "it"; # Global keymap (Fix hyprland)
        profile = "apple-t2"; # only apple-t2
      };
# -------------------- USER SETTINGS --------------------------------
      userSettings = {
        username = "matteocavestri"; # Your username (fix-scripts)
        name = "Matteo Cavestri"; # For git config
        email = "matteo.cavestri@protonmail.ch"; # For git config
        theme = "catppuccin-mocha"; # See ./themes
        wm = "hyprland"; # gnome / hyprland
        font = "Inconsolata Nerd Font"; # Your font name
        fontPkg = pkgs.inconsolata-nerdfont; # Your font package
        term = "kitty"; # Your default term (fix hyprland)
        browser = "firefox"; # TODO
      };
# -------------------------------------------------------------------
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { system = systemSettings.system; };
    in {

    nixosConfigurations = {
      ${systemSettings.hostname} = lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.apple-t2
          inputs.stylix.nixosModules.stylix
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
          inputs.stylix.homeManagerModules.stylix
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

    stylix.url = "github:danth/stylix";
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
