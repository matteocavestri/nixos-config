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

    # NVIDIA GPU Monitoring firewall
    networking.firewall = lib.mkIf config.system.services.nvidia-monitoring.enable {
      allowedTCPPorts = [
        9835
      ];
    };
  };
}
