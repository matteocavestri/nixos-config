{
  config,
  lib,
  ...
}: {
  options = {
    system.services.printing = {
      enable = lib.mkEnableOption "Enable printing support (CUPS)";
      autodiscovery = lib.mkEnableOption "Enable automatic printing discovery";
    };
  };
  config = lib.mkIf config.system.services.printing.enable {
    # Enable Printing services
    services.printing.enable = true;

    # Enable autodiscovery on Lan
    services.avahi = lib.mkIf config.system.services.printing.autodiscovery {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
