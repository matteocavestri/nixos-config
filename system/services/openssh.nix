{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };
  networking.firewall.allowedTCPPorts = [
    22
  ];
}
