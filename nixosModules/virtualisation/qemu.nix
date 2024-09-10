{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  options = {
    system.virtualisation = {
      qemu = {
        enable = lib.mkEnableOption "Enable Qemu";
        winsupport = lib.mkEnableOption "Enable Windows support";
      };
    };
  };

  config = lib.mkIf config.system.virtualisation.qemu.enable {
    # Default QEMU packages
    environment.systemPackages = with pkgs;
      [
        spice
        spice-protocol
      ]
      # Install windows virtualisation support
      ++ (lib.optionals config.system.virtualisation.qemu.winsupport [
        win-virtio
        win-spice
      ]);
    virtualisation = {
      libvirtd = {
        enable = true;

        # Main Qemu config
        qemu = {
          package = pkgs.qemu_full;
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
      spiceUSBRedirection.enable = true; # Provide USB redirection support
    };
    services.spice-vdagentd.enable = true;
    users.users.${userSettings.user.username}.extraGroups = ["libvirtd"];
  };
}
