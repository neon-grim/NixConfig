{pkgs, lib, ...}:
let
  performanceApp = lib.getExe' pkgs.corectrl "corectrl";
  calendar = lib.getExe pkgs.thunderbird;
  taskManager = lib.getExe pkgs.resources;
  volumeControl = lib.getExe pkgs.pavucontrol;
  dunstCtl = lib.getExe' pkgs.dunst "dunstctl";
  powerMenu = "pkill wofi; sleep 0.1 && wofiPowerMenu";
in
{
  imports =
  [
    ./waybar/waybarStyle.nix
  ];
  programs.waybar =
  {
    enable = true;
    settings =
    [{
      layer = "top";
      position = "top";
      modules-left =
      [
        "custom/powermenu"
        "hyprland/workspaces"
      ];
      modules-center =
      [
        "clock"
        "custom/notify"
      ];
      modules-right =
      [
        "pulseaudio"
        "pulseaudio/slider"
        "memory"
        "cpu"
        "tray"
      ];
      "cpu" =
      {
        interval = 1;
        format = "{icon}";
        format-icons = ["󰝦" "󰪞" "󰪟" "󰪠" "󰪡" "󰪢" "󰪣" "󰪤" "󰪥"];
        on-click = "sleep 0.1 && ${performanceApp}";
      };
      "clock" =
      {
        format = "{:%R %a %b %d}";
        on-click = "sleep 0.1 && ${calendar}";
        tooltip = false;
      };
      "custom/notify" =
      {
        exec = "dunstCheckMode";
        format = "{icon}";
        format-icons =
        {
           "active" = "󱇦";
           "dnd" = "󱏨";
        };
        interval = 1;
        on-click = "dunstShowNotifications";
        on-click-right = "${dunstCtl} set-paused toggle";
        on-click-middle = "${dunstCtl} history-clear";
        return-type = "json";
        tooltip = false;
      };
      "custom/powermenu" =
      {
        format = "";
        on-click = "sleep 0.1 && ${powerMenu}";
        tooltip = false;
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
          empty = "";
          urgent = "";
          "1" = "";
        };
      };
      "memory" =
      {
        interval = 1;
        format = "{icon}";
        format-icons = ["󰝦" "󰪞" "󰪟" "󰪠" "󰪡" "󰪢" "󰪣" "󰪤" "󰪥"];
        states = {
          "warning" = 85;
        };
        on-click = "sleep 0.1 && ${taskManager}";
      };
       "tray" =
      {
        spacing = 12;
        icon-size = 18;
        reverse-direction = true;
      };
      "pulseaudio" =
      {
        format = "󰕾";
        format-muted = "󰝟";
        on-click = "sleep 0.1 && ${volumeControl}";
        scroll-step = 0;
        tooltip-format = "{icon} {desc} // {volume}%";
      };
      "pulseaudio/slider" =
      {
        min = 0;
        max = 100;
        orientation = "horizontal";
      };
    }];
  };
}
