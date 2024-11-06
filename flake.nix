{
  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    self,
    ...
  } @ inputs: let
    # -------------------------------------------------------------------
    inherit (nixpkgs) lib;
    pkgs = import nixpkgs;
    pkgs-unstable = import nixpkgs-unstable;
  in {
    # -------------------- NixOS Configuration --------------------------
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        modules = [
          ./profiles/desktop.nix
        ];
        specialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
        };
      };
    };
  };

  # -------------------Inputs -----------------------------------------
  inputs = {
    # ------------------ NixPkgs ----------------------------------------
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # ------------------ Nevica ------------------------------------------
    nevica = {
      url = "github:matteocavestri/nevica";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };
}
