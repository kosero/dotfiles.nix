{ pkgs, ... }: {
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "kosero";
        email = "kosero@tuta.io";
      };
      init.defaultBranch = "main";
    };
  };
}
