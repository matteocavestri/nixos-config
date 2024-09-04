{
  services.cockpit = {
    enable = true;
    port = 9095;
    settings = {
      WebService = {
        AllowUnencrypted = true;
      };
    };
  };
  networking.firewall.allowedTCPPorts = [
    9095
  ];
}
