{pkgs, lib, config, ...}:
let
  fontName = config.desktop.style.font.name;
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
        font-family: "${fontName}";
        font-size: 16pt;
        font-weight: bold;
        border-radius: 3px;
        transition-property: background-color;
        transition-duration: 0.1s;
      }
      @keyframes blink_red
      {
        to 
        {
          color: #${txUrgent};
          background-color: #${bkUrgent};
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
        color: #${txDefault};
        background-color: #${bkDefault};
        padding: 3px;
        padding-left:8px;
        border: 2px none;
      }
      tooltip
      {
        background-color: #${bkDefault};
      }
      tooltip label
      {
        color: #${txDefault};
      }
      #clock:hover, #cpu:hover, #custom-notify:hover, #custom-powermenu:hover , #memory:hover, #wireplumber:hover, #workspaces button:hover
      {
        color: #${txBrightest};
        background-color: #${bkBrightest};
      }
    '';
    leftModuleStyling =
    ''
      #custom-powermenu
      {
        color: #${txBrighter};
        background-color: #${bkBrighter};
        padding-left: 10px;
        padding-right: 16px;
      }
      #workspaces button
      {
        color: #${txBrighter};
        padding-left: 6px;
        padding-right: 12px;
        margin-left: 3px;
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
      #wireplumber
      {
        min-width: 75px;
        margin-right: 5px;
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
        color: #${txBrighter};
        background-color: #${bkBrighter};
        margin-right: 1px;
        padding-left: 15px;
        padding-right: 15px;
      }
    '';
  in
  {
    style = (globalStyling + leftModuleStyling + centerModuleStyling + rightModuleStyling);
  };
}