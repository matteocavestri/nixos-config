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
        support32 = lib.mkEnableOption "Enable 32-bit VA-API for Intel";
        opencl = lib.mkEnableOption "Enable OpenCL for Intel";
        polaris = lib.mkEnableOption "Enable support for AMD Polaris GPUs";
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
            # Amd Rocm support for OpenCL
            ++ (lib.optionals config.system.hardware.gpu.amd.opencl [
              rocmPackages.clr.icd
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
            # Amd Rocm support for OpenCL
            ++ (lib.optionals config.system.hardware.gpu.amd.opencl [
              rocmPackages.clr.icd
            ]);

          # Vulkan support for 32-bit
          extraPackages32 = with pkgs.driversi686Linux;
            lib.optionals config.system.hardware.gpu.amd.support32 [
              amdvlk
            ];
        };
      };

    # Rocm support for Polaris (In general pre Vega GPUs) and install monitoring tool
    environment = {
      systemPackages = lib.mkIf config.system.hardware.gpu.amd.monitoring [pkgs.nvtopPackages.amd];
      variables = lib.mkIf (config.system.hardware.gpu.amd.polaris && config.system.hardware.gpu.amd.opencl) {
        ROC_ENABLE_PRE_VEGA = "1";
      };
    };

    # Export Hip library path
    systemd.tmpfiles.rules = lib.mkIf config.system.hardware.gpu.amd.opencl [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
}
