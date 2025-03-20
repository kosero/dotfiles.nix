{ pkgs, ... }: {
  xdg = {
    configFile.nvim.source = ../nvim;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withRuby = true;
    withNodeJs = true;
    withPython3 = true;
  
    extraPackages = with pkgs; [
      tree-sitter
      ripgrep
      fd
      fzf
      lazygit

      nil
      lua-language-server
      vscode-langservers-extracted
      rust-analyzer
      pyright
      black
      stylua
    ];
  };
}
