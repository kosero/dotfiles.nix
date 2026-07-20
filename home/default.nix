{ pkgs, ... }: {
  imports = [
    ./pkgs
    ./xdg.nix
    ./themes/everforest.nix
  ];
  home.username = "kosero";
  home.homeDirectory = "/home/kosero";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
