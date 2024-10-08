{
  config,
  lib,
  ...
}: {
  options = {
    system.security.server = {
      openssh = {
        enable = lib.mkEnableOption "Enable OpenSSH server";
        password = lib.mkEnableOption "SSH password authentication";
      };
    };
  };

  config = {
    # Openssh server configuration
    services.openssh = {
      enable = lib.mkIf config.system.security.server.openssh.enable true;
      settings = {
        PasswordAuthentication = lib.mkIf config.system.security.server.openssh.password true;
        PermitRootLogin = "yes";
      };
    };
    networking.firewall.allowedTCPPorts = lib.mkIf config.system.security.server.openssh.enable [
      22
    ];
  };
}
