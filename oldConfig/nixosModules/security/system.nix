{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.security = {
      sudors.enable = lib.mkEnableOption "Enable sudo in rust";
      gpg.enable = lib.mkEnableOption "Enable gpg";
    };
  };
  config = {
    # Enable sudo in rust
    security.sudo-rs.enable = lib.mkIf config.system.security.sudors.enable true;

    # Enabke gpg and gnupg package
    services.pcscd.enable = lib.mkIf config.system.security.gpg.enable true;
    programs.gnupg.agent = lib.mkIf config.system.security.gpg.enable {
      enable = true;
      enableSSHSupport = true;
    };
    environment =
      lib.mkIf config.system.security.gpg.enable
      {
        systemPackages = with pkgs; [
          gnupg
        ];
      };
  };
}
