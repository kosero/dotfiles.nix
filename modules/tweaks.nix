{ ... }: {
  # systemd-based Stage 1 initrd for faster, more reliable boot
  boot.initrd.systemd.enable = true;

  # Low-latency D-Bus implementation
  services.dbus.implementation = "broker";

  # Intel thermal management daemon
  services.thermald.enable = true;

  # Kernel sysctl tuning
  boot.kernel.sysctl = {
    "kernel.nmi_watchdog" = 0;
    "vm.vfs_cache_pressure" = 50;
    "vm.dirty_writeback_centisecs" = 1500;
    "net.core.netdev_max_backlog" = 4096;
  };

  # NVMe I/O scheduler: bypass software scheduling, use hardware queues directly
  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="nvme*", SUBSYSTEM=="block", ATTR{queue/scheduler}="none", ATTR{queue/nr_requests}="256"
  '';

  # Nix store deduplication
  nix.settings.auto-optimise-store = true;
}
