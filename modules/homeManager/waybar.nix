{host, ...}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    # Default Apps
    calendar
    fileManager
    powerMenu
    taskManager
    volumeControl
    # Waybar Color
    backgroundColorOne
    backgroundColorTwo
    backgroundColorThree
    backgroundColorFour
    textColorOne
    textColorTwo
    textColorThree
    textColorFour;
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
        ];
        modules-center =
        [ 
          "clock" 
        ];
        modules-right =
        [
          "cpu"
          "memory"
          "pulseaudio"
          "custom/notification"
          "custom/powermenu"
          "tray"
        ];
        "hyprland/workspaces" =
        {
          formnat = "{icon}";
          format-icons = 
          {
            default = " ";
            active = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
      	  on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "pulseaudio" =
        {
          format = "{icon} {volume}% {format_source}";
          format-muted = "󰖁 {volume}% {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = 
          {
            default = ["" "" "jet"];
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
          on-click = "sleep 0.1 && ${fileManager}";
        };
        "cpu" =
        {
          interval = 1;
          format = " {usage}%";
          on-click = "sleep 0.1 && ${taskManager}";
        };
        "custom/powermenu" =
        {
          format = " Power";
          on-click = "sleep 0.1 && ${powerMenu}";
          tooltip = false;
        };
        "custom/notification" = {
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
          on-click = "sleep 0.1 && swaync-client -t";
          escape = true;
        };
      }
    ];
    style =
    ''
      *
      {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 11pt;
        font-weight: bold;
        border-radius: 3px;
        transition-property: background-color;
        transition-duration: 0.1s;
      }
      @keyframes blink_red
      {
        to 
        {
          background-color: #f28fad;
          color: #1a1826;
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
        background-color: ${backgroundColorOne};
        color: ${textColorOne};
        padding: 3px;
        padding-left:8px;
        border: 2px none;
      }
      tooltip 
      {
        background-color: ${backgroundColorOne};
      }
      tooltip label 
      {
        color: ${textColorOne};
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
        padding-right: 6px;
        margin-left: 2px;
        margin-right: 2px;
      }
      #workspaces button.active
      {
        color: ${textColorTwo};
        background-color: ${backgroundColorThree};
        font-weight: bold;
      }
      #workspaces button.urgent 
      {
        color: ${textColorFour};
        background-color: ${backgroundColorFour};
      }
      #workspaces button:hover, #clock:hover, #memory:hover, #cpu:hover, #pulseaudio:hover, #custom-powermenu:hover, #custom-notification:hover
      {
        color: ${textColorThree};
        background-color: ${backgroundColorThree};
      }
      #clock, #memory, #cpu, #pulseaudio, #custom-powermenu, #custom-notification
      {
        padding-left: 10px;
        padding-right: 10px;
      }
      #tray 
      {
        padding-right: 8px;
        padding-left: 10px;
      }
    '';
  };
}
