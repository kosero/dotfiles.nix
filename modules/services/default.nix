{ ... }: {
  imports = [
    ./audio.nix
    ./resolved.nix
    ./zapret.nix
    ./ananicy.nix
    ./scx.nix
    ./zram.nix
  ];

  services.printing.enable = true;
  services.switcherooControl.enable = true;
  systemd.oomd.enable = true;
}
