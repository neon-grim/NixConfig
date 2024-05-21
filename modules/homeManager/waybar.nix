{...}:
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
          on-click = "sleep 0.1 && pavucontrol";
        };
        "clock" =
        {
          interval = 1;
          format = "{:%R  %A %b %d}";
          on-click = "sleep 0.1 && orage";
        };
        "memory" =
        {
          interval = 1;
          format = " {percentage}%";
          states = {
            "warning" = 85;
          };
          on-click = "sleep 0.1 && thunar";
        };
        "cpu" =
        {
          interval = 1;
          format = " {usage}%";
          on-click = "sleep 0.1 && xfce4-taskmanager";
        };
        "custom/powermenu" =
        {
          "format" = " Power";
          "on-click" = "sleep 0.1 && nwg-bar";
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
        background-color: #000000;
        padding: 3px;
        padding-left:8px;
        border: 2px none;
      }
      tooltip 
      {
        background-color: #000000;
      }
      tooltip label 
      {
        color: #d9e0ee;
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
        background-color: #b5e8e0;
        color: #000000;
      }
      #workspaces button.urgent 
      {
        color: #000000;
      }
      #workspaces button:hover, #clock:hover, #memory:hover, #cpu:hover, #pulseaudio:hover, #custom-powermenu:hover
      {
        background-color: #F8BD96;
        color: #000000;
      }
      #clock, #memory, #cpu, #pulseaudio, #custom-powermenu
      {
        padding-left: 10px;
        padding-right: 10px;
      }
      #memory 
      {
        color: #B5E8E0;
      }
      #cpu 
      {
        color: #F5C2E7;
      }
      #clock
      {
        color: #D9E0EE;
      }
      #pulseaudio 
      {
        color: #F5E0DC;
      }
      #tray 
      {
        padding-right: 8px;
        padding-left: 10px;
      }
      #custom-powermenu
      {
        color: #F28FAD;
      }
    '';
  };
}
