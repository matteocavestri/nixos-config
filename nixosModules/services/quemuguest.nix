{
  lib,
  config,
  ...
}: {
  options = {
    system.services.qemuguest.enable = lib.mkEnableOption "Enable Qemu Guest Agent";
  };

  config = lib.mkIf config.system.services.qemuguest.enable {
    services.qemuGuest.enable = true;
  };
}
