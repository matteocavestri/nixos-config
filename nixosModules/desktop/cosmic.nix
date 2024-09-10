{
  pkgs,
  inputs,
  ...
}: {
  # Import cosmic flake
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  # Setup dependency modules
  system.services.wayland.enable = true;

  # Nix substituters for CosmicDE Flake
  nix.settings = {
    substituters = ["https://cosmic.cachix.org/"];
    trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
  };

  # Enable cosmic xdg desktop portal
  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-cosmic
    ];
  };
  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };
}
