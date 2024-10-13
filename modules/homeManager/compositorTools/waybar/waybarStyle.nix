{pkgs, lib, config, ...}:
let
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
  txFour = config.theming.palette.txFour;
  txFive = config.theming.palette.txFive;
in
{
  programs.waybar.style =
  ''
    *
    {
      font-family: "${fontName}";
      font-size: ${toString fontSize}pt;
      font-weight: bold;
      border-radius: 3px;
      transition-property: background-color;
      transition-duration: 0.1s;
    }
    @keyframes blink_red
    {
      to 
      {
        color: #${txFour};
        background-color: #${bkFour};
      }
    }
    .warning, .critical, .urgent
    {
      animation-name: blink_red;
      animation-duration: 1s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }
    window#waybar
    {
      background-color: transparent;
    }
    window > box 
    {
      color: #${txOne};
      background-color: #${bkOne};
      padding: 3px;
      padding-left:8px;
      border: 2px none;
    }
    tooltip
    {
      background-color: #${bkOne};
    }
    tooltip label
    {
      color: #${txOne};
    }
    #workspaces
    {
      padding-left: 0px;
      padding-right: 4px; 
    }
    #custom-powermenu
    {
      padding-left: 10px;
      padding-right: 15px;
      margin-left: 5px;
      margin-right: 0px;
    }
    #workspaces button
    {
      padding-top: 5px;
      padding-bottom: 5px;
      padding-left: 6px;
      padding-right: 12px;
      margin-left: 2px;
      margin-right: 2px;
    }
    #workspaces button.active, #custom-powermenu
    {
      color: #${txTwo};
      background-color: #${bkThree};
      font-weight: bold;
    }
    #workspaces button.urgent
    {
      color: #${txFour};
      background-color: #${bkFour};
    }
    #clock
    {
      padding-left: 10px;
      padding-right: 10px;
    }
    #custom-notify
    {
      font-size: ${toString (2 + fontSize)}pt;
      min-width: 25px;
      padding-right: 4px;
    }
    #memory, #cpu, #pulseaudio
    {
      min-width: 70px;
    }
    #tray
    {
      color: #${txTwo};
      background-color: #${bkTwo};
      padding-left: 15px;
      padding-right: 15px;
      margin-left: 5px;
      margin-right: 0px;
    }
    #workspaces button:hover, #clock:hover, #memory:hover, #cpu:hover, #pulseaudio:hover, #custom-powermenu:hover, #custom-notify:hover
    {
      color: #${txThree};
      background-color: #${bkThree};
    }
  '';
}