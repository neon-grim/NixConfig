{pkgs, lib, config, ...}:
let
  fontName = config.desktop.style.font.name;
  accentDefault = config.theming.palette.accentDefault;
  bkDefault = config.theming.palette.bkDefault;
  bkBrighter = config.theming.palette.bkBrighter;
  bkBrightest = config.theming.palette.bkBrightest;
  bkUrgent = config.theming.palette.bkUrgent;
  txDefault = config.theming.palette.txDefault;
  txBrighter = config.theming.palette.txBrighter;
  txBrightest = config.theming.palette.txBrightest;
  txUrgent = config.theming.palette.txUrgent;
in
{
  programs.waybar =
  let
    globalStyling =
    ''
      *
      {
        border-radius: 0px;
        font-family: "${fontName}";
        font-size: 16pt;
        font-weight: bold;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      @keyframes blink_red
      {
        to 
        {
          background-color: #${bkUrgent};
          color: #${txUrgent};
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
        background-color: #${bkDefault};
        color: #${txDefault};
        padding-bottom: 3px;
        padding-top: 3px;
      }
      tooltip label
      {
        color: #${txDefault};
      }
      #clock:hover, #cpu:hover, #custom-notify:hover, #custom-powermenu:hover , #memory:hover, #pulseaudio:hover, #workspaces button:hover
      {
        background-color: #${bkBrightest};
        color: #${txBrightest};
      }
    '';
    leftModuleStyling =
    ''
      #custom-powermenu
      {
        background-color: #${bkBrighter};
        color: #${txBrighter};
        margin-left: 3px;
        padding-left: 10px;
        padding-right: 16px;
      }
      #workspaces button
      {
        color: #${txBrighter};
        margin-left: 3px;
        padding-left: 6px;
        padding-right: 12px;
      }
      #workspaces button.active
      {
        background-color: #${bkBrighter};
      }
    '';
    centerModuleStyling =
    ''
      #clock
      {
        padding-left: 10px;
        padding-right: 10px;
      }
      #custom-notify
      {
        min-width: 25px;
        padding-right: 4px;
      }
    '';
    rightModuleStyling =
    ''
      #pulseaudio
      {
        padding-left: 3px;
        padding-right: 6px;
      }
      #pulseaudio-slider slider
      {
        background-color: transparent;
        box-shadow: none;
      }
      #pulseaudio-slider trough
      {
        min-width: 100px;
        min-height: 15px;
        border-radius: 4px;
        background: #${bkBrightest};
      }
      #pulseaudio-slider highlight
      {
        border-radius: 4px;
        background-color: #${accentDefault};
      }
      #cpu, #memory
      {
        margin-right: 3px;
        min-width: 30px;
        padding-right: 3px;
      }
      #cpu
      {
        color: #${txBrighter};
      }
      #tray
      {
        background-color: #${bkBrighter};
        color: #${txBrighter};
        margin-right: 3px;
        padding-left: 15px;
        padding-right: 15px;
      }
    '';
  in
  {
    style = (globalStyling + leftModuleStyling + centerModuleStyling + rightModuleStyling);
  };
}