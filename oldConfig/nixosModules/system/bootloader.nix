{
  lib,
  config,
  ...
}: {
  options = {
    system.system.boot = {
      systemdboot = {
        enable = lib.mkEnableOption "Enable systemd-boot as bootloader";
      };
    };
  };

  config = {
    boot.loader = {
      # Systemd-boot configuration
      systemd-boot.enable = lib.mkIf config.system.system.boot.systemdboot.enable true;
      efi = {
        canTouchEfiVariables = false;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
