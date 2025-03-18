{ pkgs, ... }: {

  imports = [
    ./nvim
    ./nervfetch
    ./wallpapers
  ];
  
  nixpkgs.config.allowUnfree = true;

  home = {
    packages = with pkgs; [
      # APP
      spotify
      aseprite
      mpv
      brave

      kdePackages.dolphin-plugins
      kdePackages.kdegraphics-thumbnailers
      kdePackages.qtstyleplugin-kvantum
      kdePackages.qtsvg
      kdePackages.qtwayland
      flatpak
      tree
      wl-clipboard
      lshw
      unzip
      wget
      jq
      file
      playerctl
      pfetch
      kwalletmanager

      # Dev
      clang
      cargo
      lua
      gnumake
      go
      git
      
      # Font
      nerdfonts
      hack-font
      font-awesome_5
      iosevka
      ubuntu_font_family
    ];

    username = "kosero";
    homeDirectory = "/home/kosero";


    stateVersion = "24.11";
  };

  services.flatpak.enable = true;
  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"
    "com.obsproject.Studio"
    "com.usebottles.bottles"
    "com.valvesoftware.Steam"
    "dev.vencord.Vesktop"
    "fr.romainvigier.MetadataCleaner"
    "md.obsidian.Obsidian"
    "net.davidotek.pupgui2"
    "org.audacityteam.Audacity"
    "org.gimp.GIMP"
    "org.inkscape.Inkscape"
    "org.kde.krita"
    "org.mozilla.Thunderbird"
    "org.onlyoffice.desktopeditors"
    "org.prismlauncher.PrismLauncher"
    "org.qbittorrent.qBittorrent"
  ];

  xdg.configFile."user-tmpfiles.d/home-manager.conf" = {
    text = ''
      L %t/discord-ipc-0 - - - - .flatpak/dev.vencord.Vesktop/xdg-run/discord-ipc-0
    '';
    onChange = "${pkgs.systemd}/bin/systemd-tmpfiles --user --create";
  };

  home.sessionVariables = {
    ##############################
    ## NVIDIA
    ##############################
    __NV_PRIME_RENDER_OFFLOAD = "1";
    __VK_LAYER_NV_optimus = "NVIDIA_only";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    WLR_DRM_NO_ATOMIC = "1";
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    
    ##############################
    ## FIREFOX
    ##############################
    MOZ_ENABLE_WAYLAND = "1";
    
    ##############################
    ## QT
    ##############################
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    
    ##############################
    ## Wayland / XDG
    ##############################
    GDK_BACKEND = "wayland,x11";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  fonts.fontconfig.enable = true;
}
