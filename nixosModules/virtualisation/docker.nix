{
  lib,
  config,
  pkgs,
  userSettings,
  ...
}: {
  options = {
    system.virtualisation.docker = {
      enable = lib.mkEnableOption "Enable docker support";
      nvidiasupport = lib.mkEnableOption "Enable nvidia support in docker (nvidia-container-toolkit)";
    };
  };
  config = lib.mkIf config.system.virtualisation.docker.enable {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
      storageDriver = "overlay2";
      autoPrune.enable = true;
      enableNvidia = lib.mkIf config.system.virtualisation.docker.nvidiasupport true;
    };
    virtualisation.containers.enable = true;
    users.users.${userSettings.user.username}.extraGroups = ["docker"];
    environment.systemPackages = with pkgs; [
      docker
      docker-compose
    ];
  };
}
