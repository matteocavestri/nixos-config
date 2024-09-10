# TODO: better implementation (this config is single node)
{
  pkgs,
  userSettings,
  systemSettings,
  lib,
  config,
  ...
}: {
  options = {
    system.services.slurm.enable = lib.mkEnableOption "Enable Slurm (WIP)";
  };

  # Slurm config (WIP)
  config = lib.mkIf config.system.services.slurm.enable {
    services.slurm = {
      server.enable = true;
      client.enable = true;
      dbdserver = {
        enable = true;
        dbdHost = systemSettings.host.hostname;
        storageUser = userSettings.user.username;
      };
      package = pkgs.slurm;
      controlMachine = systemSettings.host.hostname;
      enableSrunX11 = true;
      user = userSettings.user.username;
      stateSaveLocation = "/var/spool/slurmctld";
    };
  };
}
