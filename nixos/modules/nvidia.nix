{ config, ... }: {
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    dynamicBoost.enable = true;

    open = true;
    nvidiaSettings = true;

    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
