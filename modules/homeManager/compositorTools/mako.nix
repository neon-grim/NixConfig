{config, pkgs, ...}:
let
  iconPath = builtins.toString pkgs.beauty-line-icon-theme;
  fontName = config.desktop.style.font.name;
  fontSize = config.desktop.style.font.size;
  bkOne = config.theming.palette.bkOne;
  bkTwo = config.theming.palette.bkTwo;
  bkThree = config.theming.palette.bkThree;
  bkFour = config.theming.palette.bkFour;
  bkFive = config.theming.palette.bkFive;
  txOne = config.theming.palette.txOne;
  txTwo = config.theming.palette.txTwo;
  txThree = config.theming.palette.txThree;
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
    textColor = "#${txOne}";
    borderColor = "#${bkFive}";
    borderRadius = 3;
    borderSize = 3;
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
      text-alignment=center
      history=1
      max-history=20
      default-timeout=10000
      
      [mode=dnd]
      invisible=1
    '';
  };
}