{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "23.11")
          then vaapiIntel
          else intel-vaapi-driver
        )
        libvdpau-va-gl
        libGLU
        # intel-media-driver
        intel-media-sdk
        # intel-compute-runtime
        intel-ocl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-vaapi-driver
      ];
    };
  };
  environment.variables = {
    VDPAU_DRIVER = lib.mkIf config.hardware.opengl.enable (lib.mkDefault "va_gl");
    LIBVA_DRIVER_NAME = "i965";
    OCL_ICD_VENDORS = "/run/opengl-driver/etc/OpenCL/vendors";
  };
  environment.systemPackages = with pkgs; [
    nvtopPackages.intel
  ];
}
