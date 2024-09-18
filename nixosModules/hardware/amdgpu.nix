{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.hardware.gpu = {
      amd = {
        enable = lib.mkEnableOption "Enable Intel GPU Hardware Acceleration";
        support32 = lib.mkEnableOption "Enable 32-bit Vulkan Support";
        opencl = lib.mkEnableOption "Enable OpenCL for AMD GPU (No rocm)";
        rocm = lib.mkEnableOption "Enable ROCm for AMD GPU";
        preVega = lib.mkEnableOption "Enable Pre Vega GPUs";
        monitoring = lib.mkEnableOption "Enable Intel GPU Monitoring";
      };
    };
  };
  config = lib.mkIf config.system.hardware.gpu.amd.enable {
    # Enable Mesa drivers and 32 bit support
    system.hardware.gpu = {
      enable = true;
      support32 = lib.mkIf config.system.hardware.gpu.amd.support32 true;
    };

    # Enable AMDGPU driver
    boot.initrd.kernelModules = ["amdgpu"];

    # Enable AMDGPU driver for xorg or xwayland
    services.xserver.videoDrivers = ["amdgpu"];

    # Setup For 24.05 and older
    hardware =
      if lib.versionOlder (lib.versions.majorMinor lib.version) "24.11"
      then {
        opengl = {
          # Amd vulkan support
          extraPackages = with pkgs;
            [
              amdvlk
            ]
            # AMD mesa Clover drivers for OpenCL
            ++ (lib.optionals (config.system.hardware.gpu.amd.opencl && ! config.system.hardware.gpu.amd.rocm) [
              mesa.opencl
            ])
            # Rocm packages
            ++ (lib.optionals config.system.hardware.gpu.amd.rocm [
              rocmPackages.rocm-core
              rocmPackages.rocm-runtime
              rocmPackages.clr
              rocmPackages.clr.icd
              rocmPackages.rocm-smi
              rocmPackages.rocminfo
            ]);

          # Vulkan support for 32-bit
          extraPackages32 = with pkgs.driversi686Linux;
            lib.optionals config.system.hardware.gpu.amd.support32 [
              amdvlk
            ];
        };
      }
      else {
        # Setup for 24.11 and newer
        graphics = {
          # Amd vulkan support
          extraPackages = with pkgs;
            [
              amdvlk
            ]
            # AMD mesa Clover drivers for OpenCL
            ++ (lib.optionals (config.system.hardware.gpu.amd.opencl && ! config.system.hardware.gpu.amd.rocm) [
              mesa.opencl
            ])
            # Rocm packages
            ++ (lib.optionals config.system.hardware.gpu.amd.rocm [
              rocmPackages.rocm-core
              rocmPackages.rocm-runtime
              rocmPackages.clr
              rocmPackages.clr.icd
              rocmPackages.rocm-smi
              rocmPackages.rocminfo
            ]);

          # Vulkan support for 32-bit
          extraPackages32 = with pkgs.driversi686Linux;
            lib.optionals config.system.hardware.gpu.amd.support32 [
              amdvlk
            ];
        };
      };

    # Install monitoring tool
    environment = {
      systemPackages = lib.mkIf config.system.hardware.gpu.amd.monitoring [pkgs.nvtopPackages.amd];
      # Setup Rocm for Pre Vega GPUs
      variables = lib.mkIf (config.system.hardware.gpu.amd.rocm && config.system.hardware.gpu.amd.preVega) {
        ROC_ENABLE_PRE_VEGA = "1";
      };
    };

    # Make Hip libraries linked to /opt/rocm/hip
    systemd.tmpfiles.rules = lib.mkIf config.system.hardware.gpu.amd.rocm [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
}
