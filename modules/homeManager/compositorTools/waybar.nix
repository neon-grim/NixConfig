{pkgs, lib, ...}:
let
  performanceApp = lib.getExe' pkgs.corectrl "corectrl";
  calendar = lib.getExe pkgs.thunderbird;
  taskManager = lib.getExe pkgs.resources;
  volumeControl = lib.getExe pkgs.pavucontrol;
  makeMute = "${lib.getExe' pkgs.mako "makoctl"} mode -t dnd";
  makoRestart = "pkill mako-wrapped && sleep 0.5 && ${lib.getExe pkgs.mako} &";
  powerMenu = "pkill wofi && sleep 0.1 && wofiPowerMenu";
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
        "hyprland/workspaces"
        "sway/workspaces"
      ];
      modules-center =
      [ 
        "clock"
        "custom/notify"
      ];
      modules-right =
      [
        "pulseaudio"
        "memory"
        "cpu"
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
        format = "{:%R  %A %b %d}";
        on-click = "${calendar}";
        tooltip = false;
      };
      "custom/notify" =
      {
        exec = "makoCheckMode";
        format = "{icon}";
        format-icons =
        {
           "active" = "󱇦";
           "dnd" = "󱏨";
        };
        interval = 1;
        on-click = "makoShowNotifications";
        on-click-right = "${makeMute}";
        on-click-middle = "${makoRestart}";
        return-type = "json";
        tooltip = false;
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
  };
}
