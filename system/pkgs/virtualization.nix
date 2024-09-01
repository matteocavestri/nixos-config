{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ../services/dconf.nix
  ];
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-protocol
    win-virtio
    win-spice
  ];
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            })
            .fd
          ];
        };
      };
      allowedBridges = [
        "nm-bridge"
        "virbr0"
      ];
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
  users.users.${userSettings.username}.extraGroups = ["libvirtd"];
}
