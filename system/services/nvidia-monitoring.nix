{pkgs, ...}: {
  systemd.services.nvidia_gpu_exporter = {
    description = "NVIDIA GPU Exporter Service";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash -c '/home/dockeradmin/nvidia/monitoring/nvidia_gpu_exporter --nvidia-smi-command=\"/run/current-system/sw/bin/nvidia-smi\"'";
      Restart = "always";
      User = "dockeradmin";
      WorkingDirectory = "/home/dockeradmin/nvidia/monitoring";
    };
  };
  networking.firewall.allowedTCPPorts = [
    9835
  ];
}
