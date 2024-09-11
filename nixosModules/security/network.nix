# TODO: Configure local DNS resolver for local networks. Make ipv6 option a system.config.network option
{
  lib,
  config,
  ...
}: {
  options = {
    system.security.network = {
      dnscrypt = {
        enable = lib.mkEnableOption "Enable DNS over tls";
        ipv6 = lib.mkEnableOption "Enable IPv6";
      };
    };
  };
  config = {
    services.dnscrypt-proxy2 = lib.mkIf config.system.security.network.dnscrypt.enable {
      # Enable dnscrypt-proxy2 service
      enable = true;
      settings = {
        # Use servers reachable over IPv6 -- Do not enable if you don't have IPv6 connectivity
        ipv6_servers = lib.mkIf config.system.security.network.dnscrypt.ipv6 true;
        block_ipv6 = lib.mkIf config.system.security.network.dnscrypt.ipv6 false;
        require_dnssec = true;
        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };
        # If you want, choose a specific set of servers that come from your sources.
        # Here it's from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
        # If you don't specify any, dnscrypt-proxy will automatically rank servers
        # that match your criteria and choose the best one.
        server_names = [
          "cloudflare"
          "cloudflare-security"
        ];
      };
    };

    # Systemd dnscrypt-proxy2 setup
    systemd.services = lib.mkIf config.system.security.network.dnscrypt.enable {
      dnscrypt-proxy2.serviceConfig = {
        StateDirectory = "dnscrypt-proxy";
        # If you're trying to set up persistence with dnscrypt-proxy2 and it isn't working
        # because of permission issues, try the following:
        # StateDirectory = lib.mkForce "";
        # ReadWritePaths = "/var/lib/dnscrypt-proxy"; # Cache directory for dnscrypt-proxy2, persist this
      };
    };

    # Nameservers and DNS setup for Dnscrypt
    networking = lib.mkIf config.system.security.network.dnscrypt.enable {
      nameservers = ["127.0.0.1" "::1"];
      networkmanager.dns = "none";
    };
  };
}
