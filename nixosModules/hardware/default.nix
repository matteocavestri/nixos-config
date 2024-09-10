{lib, ...}: {
  imports = [
    ./graphics.nix
    ./intelgpu.nix
    ./apple-t2.nix
    ./apple-silicon/default.nix
    ./nvidia.nix
  ];

  system.hardware = {
    gpu = {
      opengl = {
        enable = lib.mkDefault false;
        support32 = lib.mkDefault false;
      };
      intel = {
        enable = lib.mkDefault false;
        support32 = lib.mkDefault false;
        opencl = lib.mkDefault false;
        newgpu = lib.mkDefault false;
        monitoring = lib.mkDefault false;
      };
      nvidia = {
        enable = lib.mkDefault false;
        open = lib.mkDefault false;
        nvidia-settings = lib.mkDefault false;
        monitoring = lib.mkDefault false;
        cuda = lib.mkDefault false;
        cudnn = lib.mkDefault false;
      };
    };
    apple = {
      applet2 = {
        enable = lib.mkDefault false;
        substituters = lib.mkDefault false;
      };
    };
  };
  hardware.asahi = {
    enable = lib.mkDefault false;
    withRust = lib.mkDefault true;
    peripheralFirmwareDirectory = lib.mkDefault /etc/nixos/firmware;
    useExperimentalGPUDriver = lib.mkDefault true;
    experimentalGPUInstallMode = lib.mkDefault "replace";
    setupAsahiSound = lib.mkDefault true;
  };
}
