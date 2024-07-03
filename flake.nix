{

  outputs = { nixpkgs, nixos-hardware, self, home-manager, stylix, ... }@inputs: 
    let
# -------------------- SYSTEM SETTINGS ------------------------------
      systemSettings = {
        system = "x86_64-linux"; # Your arch 
        hostname = "nixos-t2"; # Your hostname (fix scripts)
        timezone = "Europe/Rome"; # Timezone config
        locale = "it_IT.UTF-8"; # Locale config
        keymap = "it"; # Global keymap (Fix hyprland)
        profile = "apple-t2"; # only apple-t2
        hardware ="apple-t2"; # TODO
      };
# -------------------- USER SETTINGS --------------------------------
      userSettings = {
        username = "matteocavestri"; # Your username (fix-scripts)
        name = "Matteo Cavestri"; # For git config
        email = "matteo.cavestri@protonmail.ch"; # For git config
        wm = "hyprland"; # gnome / hyprland / cinnamon
        wmType = "wayland";
        theme = "everforest"; # See ./themes
        font = "Inconsolata Nerd Font"; # Your font name
        fontPkg = pkgs.inconsolata-nerdfont; # Your font package
        cursor = "catppuccin-mocha-dark-cursors"; # Your cursor theme name 
        cursorPkg = pkgs.catppuccin-cursors.mochaDark; # Your cursor theme package
        icons = "Papirus";
        iconsPkg = pkgs.papirus-icon-theme;
        term = "alacritty"; # Your default term (fix hyprland)
        browser = "firefox"; # TODO
        dotfilesDir = ".dotfiles";
        editor = "nvim";
        #spawnEditor = if (editor == "emacsclient") then
        #              "emacsclient -c -a 'emacs'"
        #            else
        #              (if ((editor == "vim") ||
        #                   (editor == "nvim") ||
        #                   (editor == "nano")) then
        #                     "exec " + term + " -e " + editor
        #               else
        #                 editor);
      };
# -------------------------------------------------------------------
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { system = systemSettings.system; };
    in {
# -------------------- NixOS Configuration --------------------------
    nixosConfigurations = {
      ${systemSettings.hostname} = lib.nixosSystem {
        modules = [
          nixos-hardware.nixosModules.${systemSettings.hardware}
          inputs.stylix.nixosModules.stylix
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
        ];
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
        };
      };
    };
# ------------------- Home Manager Configuration ---------------------
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
          inherit inputs;
        };
      };
    };
  };
# -------------------------------------------------------------------
  nixConfig = {
    extra-substituters = [
      # "https://hydra.soopy.moe"
      "https://cache.soopy.moe" # toggle these if this one doesn't work.
    ];
    extra-trusted-public-keys =
      [ "hydra.soopy.moe:IZ/bZ1XO3IfGtq66g+C85fxU/61tgXLaJ2MlcGGXU8Q=" ];
  };
# -------------------------------------------------------------------
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    hyprland.url = "github:hyprwm/Hyprland";

    stylix.url = "github:danth/stylix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";

    neve.url = "github:matteocavestri/Neve";

    nurpkgs.url = "github:nix-community/NUR";

  };
}
