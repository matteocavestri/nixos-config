{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ../desktop/dconf.nix
  ];
  environment.systemPackages = with pkgs; [
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
  users.users.${userSettings.user.username}.extraGroups = ["libvirtd"];
}