{pkgs, lib, ...}:
let
  calendar = "${lib.getExe pkgs.thunderbird}";
  performanceApp = "${lib.getExe' pkgs.corectrl "corectrl"}";
  taskManager = "${lib.getExe pkgs.resources}";
  volumeControl = "${lib.getExe pkgs.pavucontrol}";
  powerMenu = "pkill wofi; sleep 0.1 && wofiPowerMenu";
in
{
  programs.waybar.settings =
  [{
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
  }];
}