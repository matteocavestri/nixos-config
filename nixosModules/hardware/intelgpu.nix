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
        newgpu5 = lib.mkEnableOption "Support for new GPU for Intel (Broadwell +)";
        newgpu11 = lib.mkEnableOption "Support for new GPU for Intel (Tiger Lake +)";
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

    # Apply modsetting for drivers
    services.xserver.videoDrivers = ["modesetting"];

    # Override intel vaapi driver
    nixpkgs.config.packageOverrides = pkgs: {
      intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
    };

    # Setup For 24.05 and older
    hardware =
      if lib.versionOlder (lib.versions.majorMinor lib.version) "24.11"
      then {
        opengl = {
          extraPackages = with pkgs;
          # Old intel GPU (before Broadwell) drivers
            lib.optionals (! config.system.hardware.gpu.intel.newgpu5 && ! config.system.hardware.gpu.intel.newgpu11)
            [
              libvdpau-va-gl
              libGLU
              intel-vaapi-driver
              intel-media-sdk
            ]
            # Newer GPU drivers (between Broadwell and Tiger Lake)
            ++ (lib.optionals config.system.hardware.gpu.intel.newgpu5 [
              libvdpau-va-gl
              libGLU
              intel-media-driver
              intel-media-sdk
            ])
            # Newer GPU drivers (Tiger Lake +)
            ++ (lib.optionals config.system.hardware.gpu.intel.newgpu11 [
              libvdpau-va-gl
              libGLU
              intel-media-driver
              onevpl-intel-gpu
            ])
            # OpenCL drivers
            ++ (lib.optionals config.system.hardware.gpu.intel.opencl [
              intel-ocl
              ocl-icd
              intel-compute-runtime
            ]);

          # VA-API support for 32-bit
          extraPackages32 = with pkgs.pkgsi686Linux;
            lib.optionals (config.system.hardware.gpu.intel.support32 && !config.system.hardware.gpu.intel.newgpu5 && !config.system.hardware.gpu.intel.newgpu11)
            [
              intel-vaapi-driver
            ]
            ++ (lib.optionals (config.system.hardware.gpu.intel.newgpu5 || config.system.hardware.gpu.intel.newgpu11) [
              intel-media-driver
            ]);
        };
      }
      else {
        # Setup for 24.11 and newer
        graphics = {
          extraPackages = with pkgs;
          # Old intel GPU (before Broadwell) drivers
            lib.optionals (! config.system.hardware.gpu.intel.newgpu5 && ! config.system.hardware.gpu.intel.newgpu11)
            [
              libvdpau-va-gl
              libGLU
              intel-vaapi-driver
              intel-media-sdk
            ]
            # Newer GPU drivers (between Broadwell and Tiger Lake)
            ++ (lib.optionals config.system.hardware.gpu.intel.newgpu5 [
              libvdpau-va-gl
              libGLU
              intel-media-driver
              intel-media-sdk
            ])
            # Newer GPU drivers (Tiger Lake +)
            ++ (lib.optionals config.system.hardware.gpu.intel.newgpu11 [
              libvdpau-va-gl
              libGLU
              intel-media-driver
              vpl-gpu-rt
            ])
            # OpenCL drivers
            ++ (lib.optionals config.system.hardware.gpu.intel.opencl [
              intel-ocl
              ocl-icd
              intel-compute-runtime
            ]);

          # VA-API support for 32-bit
          extraPackages32 = with pkgs.pkgsi686Linux;
            lib.optionals (config.system.hardware.gpu.intel.support32 && !config.system.hardware.gpu.intel.newgpu5 && !config.system.hardware.gpu.intel.newgpu11)
            [
              intel-vaapi-driver
            ]
            ++ (lib.optionals (config.system.hardware.gpu.intel.newgpu5 || config.system.hardware.gpu.intel.newgpu11) [
              intel-media-driver
            ]);
        };
      };

    # Setup intel environment and monitoring packages
    environment = {
      systemPackages = lib.mkIf config.system.hardware.gpu.intel.monitoring [
        pkgs.nvtopPackages.intel
        pkgs.intel-gpu-tools
      ];
      variables = {
        VDPAU_DRIVER = lib.mkIf config.system.hardware.gpu.intel.enable (lib.mkDefault "va_gl");
        # New GPUs use iHD, older only use i965
        LIBVA_DRIVER_NAME = lib.mkIf config.system.hardware.gpu.intel.enable (lib.mkDefault (
          if (config.system.hardware.gpu.intel.newgpu5 || config.system.hardware.gpu.intel.newgpu11)
          then "iHD"
          else "i965"
        ));
        OCL_ICD_VENDORS = lib.mkIf config.system.hardware.gpu.intel.opencl (lib.mkDefault "/run/opengl-driver/etc/OpenCL/vendors");
      };
    };
  };
}
