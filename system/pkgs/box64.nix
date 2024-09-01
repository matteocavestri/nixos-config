{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    box64
  ];
}
