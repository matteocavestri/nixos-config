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
        wm = "hyprland"; # gnome / hyprland
        wmType = "wayland";
        theme = "catppuccin-mocha"; # See ./themes
        font = "Inconsolata Nerd Font"; # Your font name
        fontPkg = pkgs.inconsolata-nerdfont; # Your font package
        cursor = "catppuccin-mocha-dark-cursors"; # Your cursor theme name 
        cursorPkg = pkgs.catppuccin-cursors.mochaDark; # Your cursor theme package
        term = "alacrity"; # Your default term (fix hyprland)
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
      pkgs-emacs = import inputs.emacs-pin-nixpkgs { system = systemSettings.system; };
    in {

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
          inherit pkgs-emacs;
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

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nurpkgs.url = "github:nix-community/NUR";

    emacs-pin-nixpkgs.url = "nixpkgs/f72123158996b8d4449de481897d855bc47c7bf6";

    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    nix-doom-emacs.inputs.nixpkgs.follows = "emacs-pin-nixpkgs";

    doom-emacs = {
      url = "https://github.com/doomemacs/doomemacs.git";
      flake = false;
    };

    org-yaap = {
      url = "gitlab:tygrdev/org-yaap";
      flake = false;
    };

    org-side-tree = {
      url = "github:localauthor/org-side-tree";
      flake = false;
    };

    org-timeblock = {
      url = "github:ichernyshovvv/org-timeblock";
      flake = false;
    };

    org-nursery = {
      url = "github:chrisbarrett/nursery";
      flake = false;
    };

    org-krita = {
      url = "github:librephoenix/org-krita";
      flake = false;
    };

    phscroll = {
      url = "github:misohena/phscroll";
      flake = false;

    };
    mini-frame = {
      url = "github:muffinmad/emacs-mini-frame";
      flake = false;
    };
  };
}
