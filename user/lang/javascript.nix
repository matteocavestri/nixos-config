{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Javascript
      nodejs
  ];
}
