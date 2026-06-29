{ ... }:
{
  imports = [
    ./hardware.nix
    ./kernel.nix
    ../../modules/nvidia.nix
  ];

  networking.hostName = "ln-82s9";
}
