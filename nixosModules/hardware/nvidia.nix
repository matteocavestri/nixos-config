{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    system.hardware.gpu.nvidia = {
      enable = lib.mkEnableOption "Install nvidia driver and enable hw acceleration";
      open = lib.mkEnableOption "Use the NVidia open source kernel module";
      nvidia-settings = lib.mkEnableOption "Enable Nvidia settings menu";
      monitoring = lib.mkEnableOption "Enable Nvidia monitoring using nvtop";
      cuda = lib.mkEnableOption "Enable CUDA";
      cudnn = lib.mkEnableOption "Enable cuDNN";
    };
  };

  config = lib.mkIf config.system.hardware.gpu.nvidia.enable {
    system.hardware.gpu = {
      enable = true;
      support32 = true;
    };

    nixpkgs.config.allowUnfree = true;

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Open Source kernel module
      open = lib.mkIf config.system.hardware.gpu.nvidia.open true;

      # Enable the Nvidia settings menu,
      nvidiaSettings = lib.mkIf config.system.hardware.gpu.nvidia.nvidia-settings true;

      package = config.boot.kernelPackages.nvidiaPackages.production;
    };

    # Nvidia monitoring
    environment.systemPackages = with pkgs;
      lib.optionals config.system.hardware.gpu.nvidia.monitoring [
        nvtopPackages.nvidia
      ]
      # Nvidia CUDA driver
      ++ lib.optionals config.system.hardware.gpu.nvidia.cuda [
        cudatoolkit
      ]
      # Nvidia cuDNN
      ++ lib.optionals (config.system.hardware.gpu.nvidia.cuda && config.system.hardware.gpu.nvidia.cudnn) [
        cudaPackages.cudnn
      ];
  };
}
