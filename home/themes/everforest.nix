{ pkgs, ... }: {
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
}