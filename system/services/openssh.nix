{
  services.openssh = {
    enable = true;
    PasswordAuthentication = true;
    PermitRootLogin = "yes";
  };
  networking.firewall.allowedTCPPorts = [
    22
  ];
}
