{ ... }: {
  services.zapret = {
    enable = true;
    httpSupport = true;
    configureFirewall = true;

    params = [
      "--dpi-desync=fake"
      "--dpi-desync-ttl=3"
    ];
  };
}
