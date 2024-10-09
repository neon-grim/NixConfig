{config, ...}:
let
  fontName = config.desktop.style.font.name;
  fontSize = config.desktop.style.font.size;
in
{
  programs.terminator = 
  {
    enable = true;
    config =
    {
      global_config.borderless = true;
      profiles.default = 
      {
        font = "${fontName} ${toString fontSize}";
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