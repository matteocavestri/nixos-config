{pkgs, ...}: {
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
    desktopManager = {
      cosmic.enable = true;
      cosmic-greeter.enable = true;
    };
  };
}
