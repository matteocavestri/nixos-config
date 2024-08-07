{pkgs, ...}: {
  home.packages = with pkgs; [
    nvtopPackages.full
    clinfo
    libva-utils
    vulkan-tools
  ];
}
