{ pkgs, freesmlauncher, ... }: {
  imports = [
    ./jetbrainsRider.nix
    ./vscode.nix
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
    protonup-qt
    (discord.override {
      withVencord = true;
    })
    firefox
    blender
    obs-studio

    ## OTHER
    python3Packages.kde-material-you-colors
    playerctl
  ];
}
