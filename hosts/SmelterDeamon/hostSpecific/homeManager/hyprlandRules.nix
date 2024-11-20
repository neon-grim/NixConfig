{...}:
let
  mainMonitor = "monitor:desc:Samsung Electric Company Odyssey G95SC H1AK500000";
  bottomMonitor = "monitor:desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1";
  sideMonitor = "monitor:desc:Acer Technologies ED323QUR";
in
{
  desktop.system.workspaceCount = "18";
  wayland.windowManager.hyprland.settings =
  {
    exec-once=
    [
      "hyprWorkspaceStart"
    ];
    windowrulev2 =
    [
      # Gaming
      "immediate, class:^(.*)$"
      "workspace 1 silent, class:^(steam_app_.*)$"
      "workspace 1 silent, class:^(Selaco.*)$"
      "fullscreenstate 2 2, floating:1, class:^(steam_app_.*)$"
      "fullscreenstate 2 2, floating:1, class:^(Selaco.*)$"
      # File-explorer
      "center 1, floating:1, xwayland:0, title:^(.*)$"
      "float, floating:0, title:^([O-o]pen.*)$"
      "float, floating:0, title:^([L-l]oad.*)$"
      "float, floating:0, title:^([S-s]ave.*)$"
      "float, floating:0, title:^([S-s]elect.*)$"
      "float, floating:0, title:^([C-c]hoose.*)$"
      "size 70% 70%, floating:1, title:^([O-o]pen.*)$"
      "size 70% 70%, floating:1, title:^([S-s]ave.*)$"
      "size 70% 70%, floating:1, title:^([L-l]oad.*)$"
      "size 70% 70%, floating:1, title:^([S-s]elect.*)$"
      "size 70% 70%, floating:1, title:^([C-c]hoose.*)$"
      # Prevent
      "suppressevent maximize, class:.*"
      # Workspace
      "workspace 15 silent, class:^(vesktop)$"
      "workspace 16 silent, title:^(Lollypop)$"
      "workspace special:magic, class:^(kitty)$"
    ];
    workspace =
    [
      "1, border:false, rounding:false"
      "1, ${mainMonitor}"
      "2, ${mainMonitor}, persistent:true, default:true"
      "3, ${mainMonitor}, persistent:true"
      "4, ${mainMonitor}, persistent:true"
      "5, ${mainMonitor}, persistent:true"
      "6, ${mainMonitor}, persistent:true"
      "7, ${mainMonitor}, persistent:true"
      "8, ${mainMonitor}, persistent:true"
      "9, ${mainMonitor}, persistent:true"
      "10, ${bottomMonitor}, persistent:true, default:true"
      "11, ${bottomMonitor}, persistent:true"
      "12, ${bottomMonitor}, persistent:true"
      "13, ${bottomMonitor}, persistent:true"
      "14, ${bottomMonitor}, persistent:true"
      "15, ${sideMonitor}, persistent:true, default:true"
      "16, ${sideMonitor}, persistent:true"
      "17, ${sideMonitor}, persistent:true"
      "18, ${sideMonitor}, persistent:true"
    ];
  };
}