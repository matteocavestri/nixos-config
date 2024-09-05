{
  pkgs,
  userSettings,
  ...
}: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "overlay2";
    autoPrune.enable = true;
    # TODO: deprecated, move to hardware.nvidia-container-toolkit.enable
    enableNvidia = true;
  };
  virtualisation.containers.enable = true;
  users.users.${userSettings.user.username}.extraGroups = ["docker"];
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];
  # hardware.nvidia-container-toolkit.enable = true;
}
