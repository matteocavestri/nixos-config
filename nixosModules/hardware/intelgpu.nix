{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.hardware.gpu = {
      intel = {
        enable = lib.mkEnableOption "Enable Intel GPU Hardware Acceleration";
        support32 = lib.mkEnableOption "Enable 32-bit VA-API for Intel";
        opencl = lib.mkEnableOption "Enable OpenCL for Intel";
        newgpu = lib.mkEnableOption "Support for new GPU for Intel";
        monitoring = lib.mkEnableOption "Enable Intel GPU Monitoring";
      };
    };
  };
  config = lib.mkIf config.system.hardware.gpu.intel.enable {
    # Enable Mesa drivers and 32 bit support
    system.hardware.gpu = {
      enable = true;
      support32 = lib.mkIf config.system.hardware.gpu.intel.support32 true;
    };

    # Setup For 24.05 and older
    hardware =
      if lib.versionOlder (lib.versions.majorMinor lib.version) "24.11"
      then {
        opengl = {
          extraPackages = with pkgs;
            [
              intel-vaapi-driver
              libvdpau-va-gl
              libGLU
            ]
            # Newer GPU drivers
            ++ (lib.optionals config.system.hardware.gpu.intel.newgpu [
              intel-media-driver
            ])
            # Legacy OpenCL driver
            ++ (lib.optionals (!config.system.hardware.gpu.intel.newgpu && config.system.hardware.gpu.intel.opencl) [
              intel-ocl
            ])
            # New OpenCL driver
            ++ (lib.optionals (config.system.hardware.gpu.intel.newgpu && config.system.hardware.gpu.intel.opencl) [
              intel-compute-runtime
            ]);

          # VA-API support for 32-bit
          extraPackages32 = lib.optionals config.system.hardware.gpu.intel.support32 (with pkgs.pkgsi686Linux; [
            intel-vaapi-driver
          ]);
        };
      }
      else {
        # Setup for 24.11 and newer
        graphics = {
          extraPackages = with pkgs;
            [
              intel-vaapi-driver
              libvdpau-va-gl
              libGLU
            ]
            # Newer GPU drivers
            ++ (lib.optionals config.system.hardware.gpu.intel.newgpu [
              intel-media-driver
            ])
            # Legacy OpenCL driver
            ++ (lib.optionals (!config.system.hardware.gpu.intel.newgpu && config.system.hardware.gpu.intel.opencl) [
              intel-ocl
            ])
            # New OpenCL driver
            ++ (lib.optionals (config.system.hardware.gpu.intel.newgpu && config.system.hardware.gpu.intel.opencl) [
              intel-compute-runtime
            ]);

          # VA-API support for 32-bit
          extraPackages32 = lib.optionals config.system.hardware.gpu.intel.support32 (with pkgs.pkgsi686Linux; [
            intel-vaapi-driver
          ]);
        };
      };

    # Setup intel environment and monitoring packages
    environment = {
      systemPackages = lib.mkIf config.system.hardware.gpu.intel.monitoring [pkgs.nvtopPackages.intel];
      variables = {
        VDPAU_DRIVER = lib.mkIf config.system.hardware.gpu.intel.enable (lib.mkDefault "va_gl");
        # New GPUs use iHD, older only use i965
        LIBVA_DRIVER_NAME = lib.mkIf config.system.hardware.gpu.intel.enable (lib.mkDefault (
          if config.system.hardware.gpu.intel.newgpu
          then "iHD"
          else "i965"
        ));
        OCL_ICD_VENDORS = lib.mkIf config.system.hardware.gpu.intel.opencl (lib.mkDefault "/run/opengl-driver/etc/OpenCL/vendors");
      };
    };
  };
}
