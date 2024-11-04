{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    user.virtualisation.qemu = {
      enable = lib.mkEnableOption "Enable QEMU";
      virtmanager.enable = lib.mkEnableOption "Enable virt-manager";
      tpm.enable = lib.mkEnableOption "Enable Tpm";
      uefi.enable = lib.mkEnableOption "Enable UEFI";
      defaultconnection = lib.mkEnableOption "Enable default connection";
    };
  };

  config = {
    home.packages = with pkgs;
    # Install QEMU
      lib.optionals config.user.virtualisation.qemu.enable [
        libvirt
        qemu
        dosfstools
      ]
      # Install virt-manager for GUI
      ++ (lib.optionals config.user.virtualisation.qemu.virtmanager.enable [
        virt-manager
        virt-viewer
      ])
      # Install Software Tpm
      ++ (lib.optionals config.user.virtualisation.qemu.tpm.enable [
        swtpm
      ])
      # Install Uefi utils
      ++ (lib.optionals config.user.virtualisation.qemu.uefi.enable [
        uefi-run
      ]);

    # Setup UEFI for QEMU
    home.file = lib.mkIf config.user.virtualisation.qemu.uefi.enable {
      ".config/libvirt/qemu.conf".text = ''
        nvram = ["/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd", "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd"]
      '';
    };

    # Setup Qemu as default connection for virt-manager
    dconf.settings = lib.mkIf config.user.virtualisation.qemu.defaultconnection {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };
  };
}
