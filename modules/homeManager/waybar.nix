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
    backgroundColor
    textColor
    activeBackgroundColor
    activeTextColor
    urgentBackgroundColor
    urgentTextColor
    hoverBackgroundColor
    hoverTextColor;
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
        modules-center =
        [ 
          "clock" 
        ];
        modules-left =
        [ 
          "hyprland/workspaces" 
        ];
        modules-right =
        [
          "cpu"
          "memory"
          "pulseaudio"
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
            default = ["" "" ""];
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
          "format" = " Power";
          "on-click" = "sleep 0.1 && ${powerMenu}";
          "tooltip" = false;
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
        transition-duration: 0.5s;
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
        background-color: ${backgroundColor};
        color: ${textColor};
        padding: 3px;
        padding-left:8px;
        border: 2px none;
      }
      tooltip 
      {
        background-color: ${backgroundColor};
      }
      tooltip label 
      {
        color: ${textColor};
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
        background-color: ${activeBackgroundColor};
        color: ${activeTextColor};
      }
      #workspaces button.urgent 
      {
        background-color: ${urgentBackgroundColor};
        color: ${urgentTextColor};
      }
      #workspaces button:hover, #clock:hover, #memory:hover, #cpu:hover, #pulseaudio:hover, #custom-powermenu:hover
      {
        background-color: ${hoverBackgroundColor};
        color: ${hoverTextColor};
      }
      #clock, #memory, #cpu, #pulseaudio, #custom-powermenu
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
