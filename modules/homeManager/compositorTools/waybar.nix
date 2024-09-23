{host, lib, pkgs, gtkTheme, ...}:
let
  calendar = "${lib.getExe pkgs.thunderbird}";
  performanceApp = "${lib.getExe' pkgs.corectrl "corectrl"}";
  taskManager = "${lib.getExe pkgs.resources}";
  volumeControl = "${lib.getExe pkgs.pavucontrol}";
  powerMenu = "pkill wofi; sleep 0.1 && ~/.dotfiles/scripts/wofi-power.sh";
  inherit (import ../../../hosts/${host}/hostSpecific/gtkThemes/${gtkTheme}.nix)
    backgroundColorOne
    backgroundColorTwo
    backgroundColorThree
    backgroundColorFour
    backgroundColorFive
    textColorOne
    textColorTwo
    textColorThree
    textColorFour
    textColorFive;
  inherit (import ../../../hosts/${host}/hostSpecific/themingConfig.nix)
    font
    fontSize;
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
        font-family: "${font}";
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
          color: #${textColorFour};
          background-color: #${backgroundColorFour};
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
        color: #${textColorOne};
        background-color: #${backgroundColorOne};
        padding: 3px;
        padding-left:8px;
        border: 2px none;
      }
      tooltip
      {
        background-color: #${backgroundColorOne};
      }
      tooltip label
      {
        color: #${textColorOne};
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
        color: #${textColorTwo};
        background-color: #${backgroundColorThree};
        font-weight: bold;
      }
      #workspaces button.urgent
      {
        color: #${textColorFour};
        background-color: #${backgroundColorFour};
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
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
        padding-left: 15px;
        padding-right: 15px;
        margin-left: 5px;
        margin-right: 0px;
      }
      #custom-powermenu
      {
        color: #${textColorFive};
        background-color: #${backgroundColorFive};
        padding-left: 10px;
        padding-right: 15px;
        margin-left: 5px;
        margin-right: 0px;
      }
      #workspaces button:hover, #clock:hover, #memory:hover, #cpu:hover, #pulseaudio:hover, #custom-powermenu:hover, #custom-notification:hover
      {
        color: #${textColorThree};
        background-color: #${backgroundColorThree};
      }
    '';
  };
}
