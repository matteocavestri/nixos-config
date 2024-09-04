{
  hardware = {
    asahi = {
      enable = true;
      withRust = true;
      peripheralFirmwareDirectory = /etc/nixos/firmware;
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "replace";
      setupAsahiSound = true;
    };
    opengl = {
      enable = true;
      driSupport = true;
    };
  };
  environment.sessionVariables = {
    WLR_DRM_DEVICES = "/dev/dri/card0";
  };
}
