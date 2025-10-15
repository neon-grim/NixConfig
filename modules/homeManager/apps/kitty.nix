{config, ...}:
let
  fontName = config.desktop.style.font.name;
  fontSize = config.desktop.style.font.size;
  accentDefault = config.desktop.theming.palette.accentDefault;
  bkDefault = config.desktop.theming.palette.bkDefault;
  txDefault = config.desktop.theming.palette.txDefault;
  txUrgent = config.desktop.theming.palette.txUrgent;
in
{
  programs.kitty =
  {
    enable = true;
    font =
    {
      name = fontName;
      size = fontSize;
    };
    themeFile = "rose-pine";
    settings =
    {
      background = "#${bkDefault}";
      background_opacity = 0.8;
      cursor = "#${accentDefault}";
      cursor_shape = "beam";
      foreground = "#${accentDefault}";
      scrollback_lines = 2000;
      selection_background = "#${accentDefault}";
      selection_foreground = "#${txUrgent}";
      shell = "fish";
      tab_bar_style = "powerline";
    };
  };
}