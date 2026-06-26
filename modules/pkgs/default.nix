{ pkgs, ... }: {
  imports = [
    ./nvim
    ./git.nix
  ];

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    neovim
    pfetch
    lm_sensors
    btop
    direnv
  ];
}
