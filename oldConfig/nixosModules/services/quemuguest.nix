{
  lib,
  config,
  ...
}: {
  options = {
    system.services.qemuguest.enable = lib.mkEnableOption "Enable Qemu Guest Agent";
  };

  # Qemu Guest Agent for VMs
  config = lib.mkIf config.system.services.qemuguest.enable {
    services.qemuGuest.enable = true;
  };
}
