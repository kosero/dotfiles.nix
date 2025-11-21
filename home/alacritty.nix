{
  programs.alacritty = {
    enable = true;
    theme = "gruvbox_dark";

    settings = {
      window = {
        dynamic_padding = true;
        decorations = "full";
        opacity = 0.9;
        decorations_theme_variant = "Dark";
        padding = { x = 15; y = 15; };
        blur = true;

        dimensions = {
          columns = 100;
          lines = 30;
        };
      };

      font = {
        size = 12;

        normal = {
          family = "JetBrainsMono";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono";
          style = "Bold Italic";
        };
      };

      cursor.style = "Beam";
    };
  };
}
