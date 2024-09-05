{pkgs, ...}: {
  imports = [
    ./nvidiagpu.nix
  ];
  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];
}
