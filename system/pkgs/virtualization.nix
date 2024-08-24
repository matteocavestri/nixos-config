{
  pkgs,
  userSettings,
  ...
}: {
  environment.systemPackages = with pkgs; [virt-manager];
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
  users.users.${userSettings.username}.extraGroups = ["libvirtd"];
}
