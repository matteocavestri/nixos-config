{
  imports = [
    ./nix.nix
    ./locale.nix
    ./users.nix
  ];

  # Default values
  nevica.config = {
    systemVersion = "24.11";
    locale = "en_US.UTF-8";
    keyboardLayout = "us";
    timezone = "Europe/London";
    linker.enable = true;
    garbageCollect.enable = true;
    username = "neve";
  };
}
