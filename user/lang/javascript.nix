{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    typescript
    nodePackages.npm
  ];
}
