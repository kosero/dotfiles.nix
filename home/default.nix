{ pkgs, ... }: {
  imports = [
    ./pkgs
    ./xdg.nix
  ];
  home.username = "kosero";
  home.homeDirectory = "/home/kosero";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
