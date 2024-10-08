{lib, ...}: {
  imports = [
    ./graphics.nix
    ./intelgpu.nix
    ./apple-t2.nix
    ./apple-silicon/default.nix
    ./nvidia.nix
    ./amdgpu.nix
    ./peripherals.nix
  ];

  system.hardware = {
    gpu = {
      enable = lib.mkDefault false;
      support32 = lib.mkDefault false;
      intel = {
        enable = lib.mkDefault false;
        support32 = lib.mkDefault false;
        opencl = lib.mkDefault false;
        newgpu5 = lib.mkDefault false;
        newgpu11 = lib.mkDefault false;
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
      amd = {
        enable = lib.mkDefault false;
        support32 = lib.mkDefault false;
        opencl = lib.mkDefault false;
        rocm = lib.mkDefault false;
        preVega = lib.mkDefault false;
        monitoring = lib.mkDefault false;
      };
    };
    apple = {
      applet2 = {
        enable = lib.mkDefault false;
        substituters = lib.mkDefault false;
      };
    };
    peripherals = {
      enable = lib.mkDefault false;
      logitechWheel = lib.mkDefault false;
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
