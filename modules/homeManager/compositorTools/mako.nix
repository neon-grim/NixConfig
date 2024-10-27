{config, pkgs, ...}:
let
  fontName = config.desktop.style.font.name;
  accentDefault = config.theming.palette.accentDefault;
  bkDefault = config.theming.palette.bkDefault;
  bkUrgent = config.theming.palette.bkUrgent;
  txDefault = config.theming.palette.txDefault;
  txBrighter = config.theming.palette.txBrighter;
  txUrgent = config.theming.palette.txUrgent;
  iconPath = builtins.toString pkgs.beauty-line-icon-theme;
in
{
  imports =
  [
    ./mako/makoCheckMode.nix
    ./mako/makoShowNotifications.nix
  ];
  services.mako =
  {
    enable = true;
    anchor = "top-center";
    backgroundColor = "#${bkDefault}";
    borderColor = "#${accentDefault}";
    borderRadius = 6;
    borderSize = 4;
    defaultTimeout = 10000;
    font = "${fontName} 14";
    height = 150;
    icons = true;
    iconPath = iconPath;
    layer = "overlay";
    maxVisible = 20;
    progressColor = "#${accentDefault}";
    width = 400;
    extraConfig =
    ''
      history=1
      max-history=20
      text-alignment=center
      
      [mode=dnd]
      invisible=1
      
      [urgency=low]
      text-color=#${txDefault}
      
      [urgency=normal]
      text-color=#${txBrighter}
      
      [urgency=high]
      border-color=#${bkUrgent}
      background-color=#${bkUrgent}
      text-color=#${txUrgent}
    '';
  };
}