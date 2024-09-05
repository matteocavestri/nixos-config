{
  imports = [
    ../minimal/configuration.nix
    ../../../system/security/openssh.nix
    ../../../system/services/virtualization/container.nix
    ../../../system/services/server/cockpit.nix
  ];
}
