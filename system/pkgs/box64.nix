{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.box64
  ];
}
