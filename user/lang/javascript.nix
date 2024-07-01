{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Javascript
      nodejs
      typescript
      nodePackages.npm
  ];
}
