{pkgs, lib, config, ...}:
let
  calendar = "${lib.getExe pkgs.thunderbird}";
  performanceApp = "${lib.getExe' pkgs.corectrl "corectrl"}";
  taskManager = "${lib.getExe pkgs.resources}";
  volumeControl = "${lib.getExe pkgs.pavucontrol}";
  powerMenu = "pkill wofi; sleep 0.1 && wofiPowerMenu";
  fontName = config.desktop.style.font.name; 
  fontSize = config.desktop.style.font.size;
in
{
  programs.waybar =
  {
    enable = true;
    settings =
    [
      {
        layer = "top";
        position = "top";
        modules-left =
        [
          "hyprland/workspaces"
          "sway/workspaces"
        ];
        modules-center =
        [ 
          "clock"
        ];
        modules-right =
        [
          "pulseaudio"
          "memory"
          "cpu"
          "custom/notification"
          "tray"
          "custom/powermenu"
        ];
        "tray" =
        {
          spacing = 12;
          icon-size = 18;
          reverse-direction = true;
        };
        "pulseaudio" =
        {
          format = "{icon} {volume}%";
          format-muted = "󰖁 {volume}%";
          format-icons = 
          {
            default = ["" ""];
          };
          on-click = "sleep 0.1 && ${volumeControl}";
        };
        "clock" =
        {
          interval = 1;
          format = "{:%R  %A %b %d}";
          on-click = "sleep 0.1 && ${calendar}";
        };
        "memory" =
        {
          interval = 1;
          format = " {percentage}%";
          states = {
            "warning" = 85;
          };
          on-click = "sleep 0.1 && ${taskManager}";
        };
        "cpu" =
        {
          interval = 1;
          format = " {usage}%";
          on-click = "sleep 0.1 && ${performanceApp}";
        };
        "custom/powermenu" =
        {
          format = "";
          on-click = "sleep 0.1 && ${powerMenu}";
          tooltip = false;
        };
        "custom/notification" =
        {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "";
            none = "";
            dnd-notification = "";
            dnd-none = "";
            inhibited-notification = "";
            inhibited-none = "";
            dnd-inhibited-notification = "";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
        
        "hyprland/workspaces" =
        {
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          on-click = "activate";
          format = "{icon}";
          format-icons = 
          {
            default = "";
            active = "";
            empty = "";
            urgent = "";
            "1" = "";
          };
        };
      }
    ];
    style =
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
          color: #${config.theming.palette.txFour};
          background-color: #${config.theming.palette.bkFour};
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
        color: #${config.theming.palette.txOne};
        background-color: #${config.theming.palette.bkOne};
        padding: 3px;
        padding-left:8px;
        border: 2px none;
      }
      tooltip
      {
        background-color: #${config.theming.palette.bkOne};
      }
      tooltip label
      {
        color: #${config.theming.palette.txOne};
      }
      #workspaces
      {
        padding-left: 0px;
        padding-right: 4px; 
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
      #workspaces button.active
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkThree};
        font-weight: bold;
      }
      #workspaces button.urgent
      {
        color: #${config.theming.palette.txFour};
        background-color: #${config.theming.palette.bkFour};
      }
      #clock
      {
        padding-left: 10px;
        padding-right: 10px;
      }
      #custom-notification
      {
        min-width: 50px;
      }
      #memory, #cpu, #pulseaudio
      {
        min-width: 70px;
      }
      #tray
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
        padding-left: 15px;
        padding-right: 15px;
        margin-left: 5px;
        margin-right: 0px;
      }
      #custom-powermenu
      {
        color: #${config.theming.palette.txFive};
        background-color: #${config.theming.palette.bkFive};
        padding-left: 10px;
        padding-right: 15px;
        margin-left: 5px;
        margin-right: 0px;
      }
      #workspaces button:hover, #clock:hover, #memory:hover, #cpu:hover, #pulseaudio:hover, #custom-powermenu:hover, #custom-notification:hover
      {
        color: #${config.theming.palette.txThree};
        background-color: #${config.theming.palette.bkThree};
      }
    '';
  };
}
