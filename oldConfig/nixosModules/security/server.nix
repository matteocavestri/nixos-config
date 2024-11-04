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
      increaseOpenFiles = lib.mkEnableOption "Increase max Open files to 8192";
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
    # Max Opened files
    security.pam.loginLimits = lib.mkIf config.system.security.server.increaseOpenFiles [
      {
        domain = "*";
        type = "soft";
        item = "nofile";
        value = "8192";
      }
    ];
  };
}
