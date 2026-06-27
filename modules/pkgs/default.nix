{ pkgs, ... }: {
  imports = [
    ./nvim
    ./git.nix
    ./nh.nix
  ];

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    pfetch
    lm_sensors
    btop
    direnv
  ];
}
