{config, ...}:
let
  fontName = config.desktop.style.font.name;
  fontSize = config.desktop.style.font.size;
  accentDefault = config.theming.palette.accentDefault;
  bkDefault = config.theming.palette.bkDefault;
  txDefault = config.theming.palette.txDefault;
  txUrgent = config.theming.palette.txUrgent;
in
{
  programs.kitty =
  {
    enable = true;
    themeFile = "rose-pine";
    font =
    {
      name = fontName;
      size = fontSize;
    };
    settings =
    {
      
      background = "#${bkDefault}";
      background_opacity = 0.8;
      cursor = "#${accentDefault}";
      cursor_shape = "beam";
      foreground = "#${accentDefault}";
      selection_background = "#${accentDefault}";
      selection_foreground = "#${txUrgent}";
      shell = "fish";
      tab_bar_style = "powerline";
    };
  };
}