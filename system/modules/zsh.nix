{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;

    shellInit = "$HOME/.local/bin/nervfetch";
    shellAliases = {
      ls = "lsd -l --color always";
    };

    ohMyZsh = {
      enable = true;
      theme = "aussiegeek";
      plugins = [ "git" ];
    };
  };
}
