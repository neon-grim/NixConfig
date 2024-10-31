{config, pkgs, ...}:
let
  fontName = config.desktop.style.font.name;
  accentDefault = config.theming.palette.accentDefault;
  bkDefault = config.theming.palette.bkDefault;
  bkUrgent = config.theming.palette.bkUrgent;
  txDefault = config.theming.palette.txDefault;
  txBrighter = config.theming.palette.txBrighter;
  txUrgent = config.theming.palette.txUrgent;
in
{
  imports =
  [
    
  ];
  services.dunst =
  {
    enable = true;
    iconTheme =
    {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    settings =
    {
      global =
      {
        width = 400;
        height = 300;
        corner_radius = 6;
        offset = "0x12";
        origin = "top-center";
        transparency = 10;
        font = "${fontName} 14";
      };
      urgency_low =
      {
        background = "#${bkDefault}";
        foreground = "#${txDefault}";
        frame_color = "#${accentDefault}";
        timeout = 10;
      };
      urgency_normal =
      {
        background = "#${bkDefault}";
        foreground = "#${txBrighter}";
        frame_color = "#${accentDefault}";
        timeout = 20;
      };
      urgency_critical =
      {
        background = "#${bkUrgent}";
        foreground = "#${txUrgent}";
        frame_color = "#${bkUrgent}";
        timeout = 240;
      };
    };
  };
}