{
  imports = [
    ./intel
    ./mesa
  ];

  # Default values
  neve.hardware = {
    # Intel hardware support
    intel = {
      cpu.enable = false;
      gpu = {
        enable = false;
        version = "1";
        monitoring.enable = false;
      };
    };

    # Generic Mesa GPU support
    gpu.enable = true;
  };
}
