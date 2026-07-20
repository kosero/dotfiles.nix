{ pkgs, freesmlauncher, ... }: {
  imports = [
    ./jetbrainsRider.nix
    ./vscode.nix
    ./alacritty.nix
    ./rofi.nix
    ./flatpak.nix
    ./vesktop.nix
  ];

  home.packages = with pkgs; [
    ## APP
    (freesmlauncher.packages.x86_64-linux.freesmlauncher.override {
      jdks = [ graalvmPackages.graalvm-ce ];
    })
    unityhub
    godot
    aseprite
    bottles
    firefox
    ungoogled-chromium
    blender
    obs-studio
    qbittorrent
  ];
}
