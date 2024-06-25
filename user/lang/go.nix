{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Javascript
      go
  ];
}
