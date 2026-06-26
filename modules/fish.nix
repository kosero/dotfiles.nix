{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      pfetch
    '';
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake .#ln-82s9";
    };
  };
}
