{
  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    home-manager,
    stylix,
    self,
    ...
  } @ inputs: let
    # -------------------- SYSTEM SETTINGS ------------------------------
    systemSettings = {
      nix = {
        system = "aarch64-linux"; # Your arch
        version = "24.11"; # NixOS version
      };
      host = {
        hostname = "nixos-asahi"; # Your hostname
        timezone = "Europe/Rome"; # Timezone config
        locale = "it_IT.UTF-8"; # Locale config
        keymap = "us"; # Global keymap
      };
      profile = {
        name = "work"; # personal / server / work / hypervisor
        host = "macmini-m1"; # your hardware config
      };
      monitor = {
        resolution = "1920x1080";
        refreshRate = "75";
        scaling = "1";
      };
    };
    # -------------------- USER SETTINGS --------------------------------
    userSettings = {
      user = {
        username = "matteocavestri"; # Your username
        name = "Matteo Cavestri"; # For git config
        email = "matteo.cavestri@protonmail.ch"; # For git config
        dotfilesDir = ".dotfiles"; # Your dotfiles dir (for cave helper)
      };
      wm = "hyprland"; # gnome / hyprland / cinnamon / pantheon / cde / xfce / plasma / cosmic / mate / budgie / deepin / lumina
      appearance = {
        theme = "everforest"; # See ./themes
        font = "Inconsolata Nerd Font"; # Your font name
        fontPkg = pkgs.inconsolata-nerdfont; # Your font package
        cursor = "catppuccin-mocha-dark-cursors"; # Your cursor theme name
        cursorPkg =
          pkgs.catppuccin-cursors.mochaDark; # Your cursor theme package
        icons = "Papirus"; # See docs
        iconsPkg = pkgs.papirus-icon-theme; # Your icons package
      };
      environment = {
        term = "kitty"; # Your default term (fix hyprland)
        browser = "firefox"; # Only firefox
        editor = "nvim"; # Only neovim
      };
    };
    # -------------------------------------------------------------------
    inherit (nixpkgs) lib;
    pkgs = import nixpkgs {inherit (systemSettings.nix) system;};
    pkgs-unstable = import nixpkgs-unstable {inherit (systemSettings.nix) system;};
  in {
    # -------------------- NixOS Configuration --------------------------
    nixosConfigurations = {
      ${systemSettings.host.hostname} = lib.nixosSystem {
        modules = [
          (./.
            + "/profile/name"
            + ("/" + systemSettings.profile.name)
            + "/configuration.nix")
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              users.${userSettings.user.username} = import (./.
                + "/profile/name"
                + ("/" + systemSettings.profile.name)
                + "/home.nix");
              extraSpecialArgs = {
                inherit userSettings;
                inherit systemSettings;
                inherit inputs;
                inherit pkgs-unstable;
              };
            };
          }
        ];
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
          inherit pkgs-unstable;
        };
      };
    };
  };

  # -------------------Inputs -----------------------------------------
  inputs = {
    # ------------------ NixOS Hardware ---------------------------------
    nixos-hardware.url = "github:nixos/nixos-hardware";
    # ------------------ NixPkgs ----------------------------------------
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nurpkgs.url = "github:nix-community/NUR";

    # ------------------ Home Manager -----------------------------------
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # ------------------ Hyprland ---------------------------------------
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # ------------------ Pyprland ----------------------------------------
    pyprland = {
      url = "github:hyprland-community/pyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ------------------ Stylix ------------------------------------------
    # stylix.url = "github:danth/stylix/master";
    stylix.url = "github:trueNAHO/stylix/stylix-downgrade-and-lock-tinted-kitty-input";

    # ------------------ Firefox Addons ----------------------------------
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ------------------ Nevica ------------------------------------------
    nevica = {
      url = "github:matteocavestri/nevica";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # ------------------ Cave --------------------------------------------
    cave.url = "github:matteocavestri/cave";

    # ------------------ Cosmic ------------------------------------------
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
}