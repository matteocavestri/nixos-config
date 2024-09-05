{
  imports = [
    ../minimal/configuration.nix
    ../../../system/security/openssh.nix
    ../../../system/services/virtualization/docker.nix
    ../../../system/services/virtualization/podman.nix
    ../../../system/services/server/cockpit.nix
  ];
}
