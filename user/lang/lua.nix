{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua # Lua programming language
    luajitPackages.luarocks-nix # Package manager for Lua on Nix
  ];
}
