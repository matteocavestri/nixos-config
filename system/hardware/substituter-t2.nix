{ ... }:
let substituters = [ "https://cache.soopy.moe" ];
in {
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" "repl-flake" ];

    inherit substituters;
    trusted-substituters = substituters;
    trusted-public-keys =
      [ "hydra.soopy.moe:IZ/bZ1XO3IfGtq66g+C85fxU/61tgXLaJ2MlcGGXU8Q=" ];
  };
}
