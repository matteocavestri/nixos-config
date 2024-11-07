{lib, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  neve = {
    config = {
      systemVersion = "24.11";
      locale = "en_US.UTF-8";
      keyboardLayout = "us";
      timezone = "Europe/London";
      username = lib.mkForce "something";
    };
  };
}
