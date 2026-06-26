{ pkgs, ... }:
let
  nvim-deps = with pkgs; [
    mesonlsp
    clang-tools
    rust-analyzer
    lua-language-server
    pyright
    gopls
    gcc
    gnumake
  ];
in
{
  home-manager.users.kosero = {
    home.file.".config/nvim".source = ./.;
    home.packages = nvim-deps;
  };

  home-manager.users.root = {
    home.stateVersion = "26.05";
    home.file.".config/nvim".source = ./.;
    home.packages = nvim-deps;
  };
}
