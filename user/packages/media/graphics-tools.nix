{pkgs, ...}: {
  home.packages = with pkgs; [
    clinfo
    libva-utils
    vulkan-tools
    mesa-demos
  ];
}
