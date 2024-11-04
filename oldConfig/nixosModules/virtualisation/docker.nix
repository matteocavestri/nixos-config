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

  # Enable main docker configuration
  config = lib.mkIf config.system.virtualisation.docker.enable {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
      storageDriver = "overlay2";
      autoPrune.enable = true;

      # Enable docker nvidia support
      enableNvidia = lib.mkIf config.system.virtualisation.docker.nvidiasupport true;
    };
    virtualisation.containers.enable = true;

    # Add the current user to the docker group
    users.users.${userSettings.user.username}.extraGroups = ["docker"];

    # Install docker packages
    environment.systemPackages = with pkgs; [
      docker
      docker-compose
    ];
  };
}
