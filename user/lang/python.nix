{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (python3.withPackages ( ps: with ps; [
      pip
    ]))
    # Python setup
    #python3Full
    pipx
    # Python lib
    #python311Packages-pydbus
    #python311Packages.pygobject3
  ];
}
