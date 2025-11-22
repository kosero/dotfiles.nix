{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local config = wezterm.config_builder()

      config.color_scheme = 'Gruvbox Dark (Gogh)'

      config.colors = {
        tab_bar = {
          background = "#282828",

          active_tab = {
            bg_color = "#282828",
            fg_color = "#ebdbb2",
          },

          inactive_tab = {
            bg_color = "#3c3836",
            fg_color = "#a89984",
          },

          inactive_tab_hover = {
            bg_color = "#504945",
            fg_color = "#ebdbb2",
          },

          new_tab = {
            bg_color = "#282828",
            fg_color = "#a89984",
          },

          new_tab_hover = {
            bg_color = "#504945",
            fg_color = "#1d2021",
            italic = true,
          },
        },
      }

      config.font =
        wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })

      return config
    '';
  };
}
