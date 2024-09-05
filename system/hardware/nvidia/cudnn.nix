{pkgs, ...}: {
  imports = [
    ./cuda.nix
  ];
  environment.systemPackages = with pkgs; [
    cudaPackages.cudnn
  ];
}
