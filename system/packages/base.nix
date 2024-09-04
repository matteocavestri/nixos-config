{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [
    pkgs.vim
    pkgs.wget
    pkgs.git
    inputs.cave.packages.${pkgs.system}.cave
  ];
}
