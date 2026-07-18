{ pkgs, config, lib, ... }:
let
  blackholeDur = pkgs.fetchurl {
    url = "https://codeberg.org/fairyglade/ly-community/raw/branch/main/animations/dur/blackhole-smooth-240x67.dur";
    sha256 = "05a48i16lbsykdny0qrgkqrag8j20wv0slmlzlh2p037zg6cb3f2";
  };
in {
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "dur_file";
      dur_file_path = "${blackholeDur}";
      dur_offset_alignment = "center";
      full_color = true;
    };
  };

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
    rofi
    feh
    xsetroot
    thunar
    flameshot
    playerctl
    xprintidle
    lemonbar-xft
    everforest-cursors
    everforest-gtk-theme
    xclip
    copyq
    dunst
    libnotify
    blueman
    pavucontrol
  ];

  home-manager.users.kosero = {
    gtk = {
      enable = true;
      theme = {
        name = "Everforest-Dark";
        package = pkgs.everforest-gtk-theme;
      };
      iconTheme = {
        name = "Colloid-Teal-Everforest";
        package = pkgs.colloid-icon-theme.override {
          colorVariants = [ "teal" ];
          schemeVariants = [ "everforest" ];
        };
      };
      cursorTheme = {
        name = "everforest-cursors";
        package = pkgs.everforest-cursors;
      };
    };

    home.pointerCursor = {
      name = "everforest-cursors";
      package = pkgs.everforest-cursors;
      size = 24;
      x11.enable = true;
      gtk.enable = true;
    };

    xdg.configFile."bspwm" = {
      source = ./.;
      recursive = true;
    };
  };
}
