{
  imports = [
    ../minimal/configuration.nix
    ../../system/pkgs/container.nix
    ../../system/pkgs/servermonitor.nix
    ../../system/services/openssh.nix
    ../../system/services/cockpit.nix
  ];
}
