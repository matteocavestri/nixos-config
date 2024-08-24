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
      system = "aarch64-linux"; # Your arch
      hostname = "nixos-asahi"; # Your hostname (fix scripts)
      timezone = "Europe/Rome"; # Timezone config
      locale = "it_IT.UTF-8"; # Locale config
      keymap = "us"; # Global keymap (Fix hyprland)
      profile = "work"; # personal / minimal-gui / work
      hardware = "macmini-m1"; # your hardware config
      # nixhw = "apple-t2"; # Your Nixos hardware
    };
    # -------------------- USER SETTINGS --------------------------------
    userSettings = {
      username = "matteocavestri"; # Your username (fix-scripts)
      name = "Matteo Cavestri"; # For git config
      email = "matteo.cavestri@protonmail.ch"; # For git config
      wm = "cinnamon"; # gnome / hyprland / cinnamon / pantheon / cde / xfce / plasma / cosmic / mate / budgie / deepin / lumina
      theme = "catppuccin-mocha"; # See ./themes
      font = "Inconsolata Nerd Font"; # Your font name
      fontPkg = pkgs.inconsolata-nerdfont; # Your font package
      cursor = "catppuccin-mocha-dark-cursors"; # Your cursor theme name
      cursorPkg =
        pkgs.catppuccin-cursors.mochaDark; # Your cursor theme package
      icons = "Papirus"; # See docs
      iconsPkg = pkgs.papirus-icon-theme; # Your icons package
      term = "kitty"; # Your default term (fix hyprland)
      browser = "firefox"; # Only firefox
      dotfilesDir = ".dotfiles"; # Your dotfiles dir
      editor = "nvim"; # Only neovim
    };
    # -------------------------------------------------------------------
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {system = systemSettings.system;};
    pkgs-unstable =
      import nixpkgs-unstable {system = systemSettings.system;};
  in {
    # -------------------- NixOS Configuration --------------------------
    nixosConfigurations = {
      ${systemSettings.hostname} = lib.nixosSystem {
        modules = [
          # nixos-hardware.nixosModules.${systemSettings.nixhw}
          inputs.stylix.nixosModules.stylix
          inputs.nixos-cosmic.nixosModules.default
          (./.
            + "/profiles"
            + ("/" + systemSettings.profile)
            + "/configuration.nix")
        ];
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
          inherit pkgs-unstable;
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
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nurpkgs.url = "github:nix-community/NUR";

    # ------------------ Home Manager -----------------------------------
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # ------------------ Hyprland ---------------------------------------
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";

    # ------------------ Pyprland ----------------------------------------
    pyprland.url = "github:hyprland-community/pyprland";

    # ------------------ Stylix ------------------------------------------
    stylix.url = "github:danth/stylix";

    # ------------------ Firefox Addons ----------------------------------
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ------------------ Nevica ------------------------------------------
    nevica.url = "github:matteocavestri/nevica";

    # ------------------ Cave --------------------------------------------
    cave.url = "github:matteocavestri/cave";

    # ------------------ Ags ---------------------------------------------
    ags.url = "github:Aylur/ags"; # Unused

    # ------------------ Cosmic ------------------------------------------
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
