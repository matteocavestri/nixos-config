{lib, ...}: {
  imports = [
    ./graphics.nix
    ./intelgpu.nix
    ./apple-t2.nix
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
    };
    apple = {
      applet2 = {
        enable = lib.mkDefault false;
        substituters = lib.mkDefault false;
      };
    };
  };
}
