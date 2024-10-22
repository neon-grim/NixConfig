{...}:
let
  mainMonitor = "monitor:desc:Samsung Electric Company Odyssey G95SC H1AK500000";
  bottomMonitor = "monitor:desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1";
  sideMonitor = "monitor:desc:Acer Technologies ED323QUR";
in
{
  wayland.windowManager.hyprland.settings =
  {
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
      # Apps
      "workspace 22 silent, title:^(Steam)$"
      "workspace 23 silent, title:^(Heroic Games Launcher)$"
      "workspace 24 silent, class:^(com\.obsproject\.Studio)$"
      "workspace 25 silent, title:^(CoreCtrl)$"
      "workspace 42 silent, class:^(vesktop)$"
      "workspace 43 silent, class:^(vesktop)$, initialClass:^(Discord Popout)$"
      "workspace 44 silent, title:^(Lollypop)$"
      "workspace special:magic, class:^(terminator)$"
    ];
    workspace =
    [
      "1, border:false, rounding:false"
      "1, ${mainMonitor}"
      "2, ${mainMonitor}, default:true, persistent:true"
      "22, ${bottomMonitor}"
      "23, ${bottomMonitor}"
      "24, ${bottomMonitor}"
      "25, ${bottomMonitor}"
      "26, ${bottomMonitor}, default:true, persistent:true"
      "42, ${sideMonitor}, default:true, persistent:true"
      "43, ${sideMonitor}"
      "44, ${sideMonitor}"
    ];
  };
}