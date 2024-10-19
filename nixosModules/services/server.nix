{
  lib,
  config,
  pkgs,
  userSettings,
  ...
}: {
  options = {
    system.services = {
      cockpit.enable = lib.mkEnableOption "Enable cockpit webui monitoring";
      nvidia-monitoring.enable = lib.mkEnableOption "Enable nvidia monitoring exporter for prometheus";
      nextcloud-ai-worker.enable = lib.mkEnableOption "Enable Nextcloud AI worker in background !!YOU MUST HAVE NEXTCLOUD AIO RUNNING IN DOCKER!!";
    };
  };

  config = {
    # Cockpit webui monitoring configuration
    services.cockpit = lib.mkIf config.system.services.cockpit.enable {
      enable = true;
      port = 9095;
      settings = {
        WebService = {
          AllowUnencrypted = true;
        };
      };
    };

    # NVIDIA GPU Exporter for prometheus
    systemd.services = {
      nvidia_gpu_exporter = lib.mkIf config.system.services.nvidia-monitoring.enable {
        description = "NVIDIA GPU Exporter Service";
        after = ["network.target"];
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          ExecStart = "${pkgs.bash}/bin/bash -c '/home/dockeradmin/nvidia/monitoring/nvidia_gpu_exporter --nvidia-smi-command=\"/run/current-system/sw/bin/nvidia-smi\"'";
          Restart = "always";
          User = "${userSettings.user.username}";
          WorkingDirectory = "/home/${userSettings.user.username}/nvidia/monitoring";
        };
      };
    };

    systemd.services = {
      nextcloud-ai-worker = lib.mkIf config.system.services.nextcloud-ai-worker.enable {
        description = "Nextcloud AI worker";
        after = ["network.target"];
        wantedBy = ["multi-user.target"];

        serviceConfig = {
          ExecStart = "${pkgs.bash}/bin/bash -c 'set -e; while true; do docker exec -u www-data -it nextcloud-aio-nextcloud php occ background-job:worker -v -t 60 \"OC\\TaskProcessing\\SynchronousBackgroundJob\"; done'";
          Restart = "always";
        };
        instanced = true;
      };
    };

    # NVIDIA GPU Monitoring firewall
    networking.firewall = lib.mkIf config.system.services.nvidia-monitoring.enable {
      allowedTCPPorts = [
        9835
      ];
    };
  };
}
