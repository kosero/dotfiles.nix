{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./kernel.nix
    ../../modules/nvidia.nix
  ];
}
