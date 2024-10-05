{...}:
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
      "workspace 24 silent, title:^(CoreCtrl)$"
      "workspace 25 silent, title:^(Lollypop)$"
      "workspace 42 silent, class:^(vesktop)$"
      "workspace special:magic, class:^(terminator)$"
    ];
    workspace =
    [
      "1, border:false, rounding:false"
      "1, monitor:desc:Samsung Electric Company Odyssey G95SC H1AK500000"
      "2, monitor:desc:Samsung Electric Company Odyssey G95SC H1AK500000, default:true, persistent:true"
      "22, monitor:desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1, default:true, persistent:true"
      "23, monitor:desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1"
      "24, monitor:desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1"
      "25, monitor:desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1"
      "42, monitor:desc:Acer Technologies ED323QUR, default:true, persistent:true"
    ];
  };
}