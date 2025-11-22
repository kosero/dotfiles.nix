{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/nvidia.nix
      ./modules/zsh.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  boot.crashDump.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
    hostName = "nixos";
    # wireless.enable = true;
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    networkmanager.enable = true;
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    firewall.enable = true;
    useDHCP = lib.mkDefault true;
  };

  time.timeZone = "Europe/Istanbul";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "tr_TR.UTF-8";
      LC_IDENTIFICATION = "tr_TR.UTF-8";
      LC_MEASUREMENT = "tr_TR.UTF-8";
      LC_MONETARY = "tr_TR.UTF-8";
      LC_NAME = "tr_TR.UTF-8";
      LC_NUMERIC = "tr_TR.UTF-8";
      LC_PAPER = "tr_TR.UTF-8";
      LC_TELEPHONE = "tr_TR.UTF-8";
      LC_TIME = "tr_TR.UTF-8";
    };
  };

  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "breeze";
      };
    };

    switcherooControl.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    printing.enable = true;

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    resolved = {
      enable = true;
      dnsovertls = "true";
      dnssec = "true";
      fallbackDns = [ "1.1.1.1" "1.0.0.1" ];
    };

    flatpak.enable = true;
    zapret = {
      enable = true;
      params = [
        "--dpi-desync=fake"
        "--dpi-desync-ttl=3"
      ];
    };

    scx = {
      enable = true;
      scheduler = "scx_bpfland";
    };

    ananicy = {
      enable = true;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };

    # openssh.enable = true;
  };

  systemd.oomd = {
    enable = true;
    enableUserSlices = true;
  };
  zramSwap = {
    enable = true;
    priority = 100;
  };

  security.rtkit.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.kosero = {
      isNormalUser = true;
      description = "kosero";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.dolphin-plugins
        kdePackages.kdegraphics-thumbnailers
        kdePackages.qtsvg
        kdePackages.qtwayland
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     home-manager
     lsd
     wget
     git
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    # gnupg.agent = {
    #  enable = true;
    #  enableSSHSupport = true;
    # };
    # mtr.enable = true;
  };

  system.stateVersion = "25.05";
}
