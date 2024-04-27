{ config, lib, pkgs, ... }:

{
  programs.waybar = 
  {
    enable = true;
    package = pkgs.waybar;
    settings =
    [
      {
        layer = "top";
        position = "top";
        modules-center = [ "clock" ];
        modules-left =  
        [ 
          "hyprland/workspaces" 
        ];
        modules-right = 
        [ 
          "cpu"
          "memory"
          "pulseaudio"
          "network"
          "custom/powermenu"
          "tray" 
        ];
        
        "hyprland/workspaces" = 
        {
          formnat = "{icon}";
          format-icons = 
          {
            default = "s";
            active = "x";
            urgent = " b";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
      	  on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        
        "custom/launcher" = 
        {
          format = " ";
          on-click = "pkill rofi || rofi2";
          on-click-middle = "exec default_wall";
          on-click-right = "exec wallpaper_random";
          tooltip = false;
        };
        
        "pulseaudio" = 
        {
          scroll-step = 1;
          format = "VOL {volume}%";
          format-muted = "󰖁 Muted";
          format-icons = 
          {
            default = [ "" "" "" ];
          };
          on-scroll-up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
      	  on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      	  on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          tooltip = false;
        };
        
        "clock" = {
          interval = 1;
          format = "{:%R  %A %b %d}";
        };
        
        "memory" = {
          interval = 1;
          format = "RAM {percentage}%";
          states = {
            "warning" = 85;
          };
        };
        "cpu" = {
          interval = 1;
          format = "CPU {usage}%";
        };
        "custom/powermenu" = 
        {
          format = " ";
          on-click = "wlogout";
        };
      }
    ];
    
    style = 
    ''
      *
      {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12pt;
        font-weight: bold;
        border-radius: 8px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      @keyframes blink_red
      {
        to 
        {
          background-color: rgb(242, 143, 173);
          color: rgb(26, 24, 38);
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
        margin-left: 5px;
        margin-right: 5px;
        margin-top: 5px;
        background-color: #1e1e2a;
        padding: 3px;
        padding-left:8px;
        border: 2px none #33ccff;
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
      }
      #workspaces button.active 
      {
        background-color: rgb(181, 232, 224);
        color: rgb(26, 24, 38);
      }
      #workspaces button.urgent 
      {
        color: rgb(26, 24, 38);
      }
      #workspaces button:hover 
      {
        background-color: rgb(248, 189, 150);
        color: rgb(26, 24, 38);
      }
      tooltip 
      {
        background: rgb(48, 45, 65);
      }
      tooltip label 
      {
        color: rgb(217, 224, 238);
      }
      #custom-launcher 
      {
        font-size: 20px;
        padding-left: 8px;
        padding-right: 6px;
        color: #7ebae4;
      }
      #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal
      {
        padding-left: 10px;
        padding-right: 10px;
      }
      #memory 
      {
        color: rgb(181, 232, 224);
      }
      #cpu 
      {
        color: rgb(245, 194, 231);
      }
      #clock
      {
        color: rgb(217, 224, 238);
      }
      #pulseaudio 
      {
        color: rgb(245, 224, 220);
      }
      #network
      {
        color: #ABE9B3;
      }
      #network.disconnected 
      {
        color: rgb(255, 255, 255);
      }
      #custom-powermenu
      {
        color: rgb(242, 143, 173);
        padding-right: 8px;
      }
      #tray 
      {
        padding-right: 8px;
        padding-left: 10px;
      }
    '';
  };
}
