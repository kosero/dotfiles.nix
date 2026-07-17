{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    windowManager.bspwm = {
      enable = true;
    };

    xkb = {
      layout = "us";
      variant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    bspwm
    sxhkd
    alacritty
    rofi
    feh
    xorg.xsetroot
    thunar
    chromium
    flameshot
    playerctl
    xprintidle
  ];

  home-manager.users.kosero = {
    xdg.configFile."bspwm" = {
      source = ./.;
      recursive = true;
    };
  };
}
