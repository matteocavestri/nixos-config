{
  pkgs,
  inputs,
  ...
}: {
  system.stateVersion = "24.05";
  # System Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [
    pkgs.vim
    pkgs.wget
    pkgs.git
    inputs.cave.packages.${pkgs.system}.cave
  ];
}
