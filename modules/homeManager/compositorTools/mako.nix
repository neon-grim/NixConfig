{config, pkgs, ...}:
let
  fontName = config.desktop.style.font.name;
  fontSize = config.desktop.style.font.size;
  bkOne = config.theming.palette.bkOne;
  bkFour = config.theming.palette.bkFour;
  txOne = config.theming.palette.txOne;
  txTwo = config.theming.palette.txTwo;
  txFour = config.theming.palette.txFour;
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
    backgroundColor = "#${bkOne}";
    borderColor = "#${bkFive}";
    borderRadius = 3;
    borderSize = 3;
    defaultTimeout = 10000;
    font = "${fontName} ${toString fontSize}";
    height = 150;
    icons = true;
    iconPath = iconPath;
    layer = "overlay";
    maxVisible = 20;
    progressColor = "#${bkFive}";
    width = 400;
    extraConfig =
    ''
      history=1
      max-history=20
      text-alignment=center
      
      [mode=dnd]
      invisible=1
      
      [urgency=low]
      text-color=#${txOne}
      
      [urgency=normal]
      text-color=#${txTwo}
      
      [urgency=high]
      border-color=#${bkFour}
      background-color=#${bkFour}
      text-color=#${txFour}
    '';
  };
}