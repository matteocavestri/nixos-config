{
  services.openssh = {
    enable = true;
    PermitRootLogin = "yes";
  };
  networking.firewall.allowedTCPPorts = [
    22
  ];
}
