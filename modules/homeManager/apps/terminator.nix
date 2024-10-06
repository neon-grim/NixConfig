{config, ...}:
{
  programs.terminator = 
  {
    enable = true;
    config =
    {
      global_config.borderless = true;
      profiles.default = 
      {
        font = "${config.desktop.font.name} ${toString config.desktop.font.size}";
        use_system_font = false;
        allow_bold = true;
        background_darkness = 0.90;
        background_type = "transparent";
        use_theme_colors = true;
        show_titlebar = false;
        use_custom_command = true;
        custom_command = "fish";
      };
    };
  };
}