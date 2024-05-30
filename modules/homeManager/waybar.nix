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
    backgroundColorFive
    textColorOne
    textColorTwo
    textColorThree
    textColorFour
    textColorFive;
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
          "cpu"
          "memory"
          "pulseaudio"
          "cava"
        ];
        modules-center =
        [ 
          "hyprland/workspaces" 
        ];
        modules-right =
        [
          "clock"
          "custom/notification"
          "custom/powermenu"
        ];
        "hyprland/workspaces" =
        {
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          on-click = "activate";
          format = "{icon}";
          
          format-icons = 
          {
            active = "";
            empty = "";
            default = "";
            urgent = "";
          };
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
          format = " {usage}% {avg_frequency}GHz";
          on-click = "sleep 0.1 && ${taskManager}";
        };
        "custom/powermenu" =
        {
          format = "";
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
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
        cava = 
        {
          framerate = 30;
          autosens = 1;
          bars = 14;
          lower_cutoff_freq = 50;
          method = "pipewire";
          source = "auto";
          stereo = true;
          reverse = true;
          hide_on_silence = true;
          bar_delimiter = 0;
          noise_reduction = 0.75;
          input_delay = 2;
          higher_cutoff_freq = 10000;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          actions = 
          {
	          on-click-right = "mode";
	        };
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
          color: ${textColorFour};
          background-color: ${backgroundColorFour};
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
        color: ${textColorOne};
        background-color: ${backgroundColorOne};
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
        padding-right: 13px;
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
        padding-left: 13px;
        padding-right: 13px;
      }
      #custom-powermenu
      {
        color: ${textColorFive};
        background-color: ${backgroundColorFive};
        padding-left: 10px;
        padding-right: 16px;
        margin-left: 5px;
      }
      #cava
      {
        font-size: 15pt;
        padding-left: 10px;
        padding-right: 10px;
      }
    '';
  };
}
