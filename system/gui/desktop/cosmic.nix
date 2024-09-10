{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-cosmic.nixosModules.default
  ];

  system.services.wayland.enable = true;

  nix.settings = {
    substituters = ["https://cosmic.cachix.org/"];
    trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-cosmic
    ];
  };
  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };
}
