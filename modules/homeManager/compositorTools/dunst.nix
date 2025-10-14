{config, pkgs, ...}:
let
  fontName = config.desktop.style.font.name;
  accentDefault = config.desktop.theming.palette.accentDefault;
  bkDefault = config.desktop.theming.palette.bkDefault;
  bkUrgent = config.desktop.theming.palette.bkUrgent;
  txDefault = config.desktop.theming.palette.txDefault;
  txBrighter = config.desktop.theming.palette.txBrighter;
  txUrgent = config.desktop.theming.palette.txUrgent;
in
{
  imports =
  [
    ./dunst/dunstCheckMode.nix
    ./dunst/dunstShowNotifications.nix
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
        monitor= "mouse";
        height = 300;
        width = 400;
        offset = "0x12";
        gap_size = 6;
        frame_width = 2;
        corner_radius = 2;
        origin = "top-center";
        transparency = 10;
        font = "${fontName} 14";
      };
      urgency_low =
      {
        background = "#${bkDefault}";
        foreground = "#${txDefault}";
        frame_color = "#${accentDefault}";
        timeout = 7;
      };
      urgency_normal =
      {
        background = "#${bkDefault}";
        foreground = "#${txBrighter}";
        frame_color = "#${accentDefault}";
        timeout = 15;
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