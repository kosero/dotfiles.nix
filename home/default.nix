{ pkgs, ... }: {
  imports = [
    ./nixvim.nix
    ./vesktop.nix
    ./wezterm.nix
    ./wallpapers
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    packages = with pkgs; [
      #######
      # App #
      #######
      spotify
      aseprite
      mpv
      brave
      easyeffects
      btop
      superTuxKart
      vscode

      tree
      wl-clipboard
      lshw
      unzip
      unrar
      wget
      jq
      file
      playerctl
      pfetch

      #######
      # Dev #
      #######
      lua
      gnumake
      go
      git
      godotPackages_4_5.godot
      bun
      unityhub
      jetbrains-toolbox
      nodejs_24
      raylib

      # .NET
      dotnet-sdk
      dotnet-runtime

      # C
      clang
      clang-tools

      # Rust
      cargo
      rustc

      # Python
      python3
      python3Packages.pip
      python3Packages.virtualenv

      ########
      # Font #
      ########
      nerd-fonts._0xproto
      nerd-fonts.droid-sans-mono
      hack-font
      font-awesome_5
      iosevka
      ubuntu_font_family
      jetbrains-mono
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ];

    username = "kosero";
    homeDirectory = "/home/kosero";

    stateVersion = "25.05";
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
