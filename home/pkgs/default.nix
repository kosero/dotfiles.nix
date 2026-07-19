{ pkgs, freesmlauncher, ... }: {
  imports = [
    ./jetbrainsRider.nix
    ./vscode.nix
    ./alacritty.nix
    ./rofi.nix
    ./flatpak.nix
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
    vesktop
    firefox
    ungoogled-chromium
    blender
    obs-studio
    qbittorrent
    firefox

    ## OTHER
    python3Packages.kde-material-you-colors
    playerctl
  ];
}
