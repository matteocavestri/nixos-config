{
  lib,
  config,
  ...
}: {
  options = {
    system.config.boot = {
      systemdboot = {
        enable = lib.mkEnableOption "Enable systemd-boot as bootloader";
      };
    };
  };

  config = {
    boot.loader = {
      systemd-boot.enable = lib.mkIf config.system.config.boot.systemdboot.enable true;
      efi = {
        canTouchEfiVariables = false;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
