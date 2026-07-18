{ ... }: {
  imports = [
    ./audio.nix
    ./resolved.nix
    ./zapret.nix
    ./ananicy.nix
    ./scx.nix
    ./zram.nix
    ./tlp.nix
  ];

  services.printing.enable = true;
  services.switcherooControl.enable = true;
  systemd.oomd = {
    enable = true;
    enableUserSlices = true;
  };
  services.fstrim.enable = true;
  services.thermald.enable = true;
}
