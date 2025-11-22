{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/cdd3c467-136e-45bf-9974-56cd0d932fab";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0568-F156";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/fb4925ed-8722-4240-b4eb-db713b7863c3"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
