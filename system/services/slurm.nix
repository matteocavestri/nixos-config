# TODO: better implementation (this config is single node)
{
  pkgs,
  userSettings,
  systemSettings,
  ...
}: {
  services.slurm = {
    server.enable = true;
    client.enable = true;
    dbdserver = {
      enable = true;
      dbdHost = systemSettings.hostname;
      storageUser = userSettings.username;
    };
    package = pkgs.slurm;
    controlMachine = systemSettings.hostname;
    enableSrunX11 = true;
    user = userSettings.username;
    stateSaveLocation = "/var/spool/slurmctld";
  };
}