{ pkgs, ... }: {
  home.packages = with pkgs; [
    jetbrains.rider
  ];

  home.file.".local/share/applications/jetbrains-rider.desktop".source =
    let
      desktopFile = pkgs.makeDesktopItem {
        name = "jetbrains-rider";
        desktopName = "Rider";
        exec = "\"${pkgs.jetbrains.rider}/bin/rider\"";
        icon = "rider";
        type = "Application";
        extraConfig.NoDisplay = "true";
      };
    in
    "${desktopFile}/share/applications/jetbrains-rider.desktop";
}
