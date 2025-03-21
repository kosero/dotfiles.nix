{
 programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;

    shellInit = "$HOME/.local/bin/nervfetch";
    shellAliases = {
      # lsd
      ls = "lsd -l --color always";
      
      # git
      gitc = "git clone";
      gitcmt = "git commit -m";
      gitp = "git push";
    };

    ohMyZsh = {
      enable = true;
      theme = "aussiegeek";
      plugins = [ "git" ];
    };
  };
}
