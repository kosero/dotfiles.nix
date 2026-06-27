{ ... }: {
  networking.nameservers = [
    "1.1.1.1#one.one.one.one"
    "1.0.0.1#one.one.one.one"
  ];

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSSEC = "true";
        DNSOverTLS = "true";
        Domains = [ "~." ];
        FallbackDNS = [
          "9.9.9.9#dns.quad9.net"
          "149.112.112.112#dns.quad9.net"
        ];
      };
    };
  };
}
