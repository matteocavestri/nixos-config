{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nvtopPackages.intel
    clinfo
    libva-utils
    vulkan-tools
  ];
}
