{config, ...}:
let
  mainMonitorRes = "5120x1440";
  mainMonitorPos = "1440x640";
  mainMonitor = "desc:Samsung Electric Company Odyssey G95SC H1AK500000";
  bottomMonitor = "desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1";
  sideMonitor = "desc:Acer Technologies ED323QUR";
  wallpaperOne = "~/Pictures/Background/Superwide/Death_Superwide.png";
  wallpaperTwo = "~/Pictures/Background/Uncompressed/red_transistor.png";
  wallpaperthree = "~/Pictures/Background/Uncompressed/instrument.png";
  lockedWallpaper = "~/Pictures/Background/Uncompressed/evangelion.png";
in
{
  desktop.system.mainMon =
  {
    name = mainMonitor;
    res = mainMonitorRes;
    oc = "240.00";
    pos = mainMonitorPos;
  };
  wayland.windowManager.hyprland.settings.monitor =
  [
    "${mainMonitor}, ${mainMonitorRes}@120.00, ${mainMonitorPos}, 1"
    "${bottomMonitor}, preferred, 2720x2080, 1"
    "${sideMonitor}, preferred, 0x0, 1, transform, 3"
    ", preferred, auto, 1"
  ];
  services.hyprpaper.settings =
  {
    preload =
    [
      "${wallpaperOne}"
      "${wallpaperTwo}"
      "${wallpaperthree}"
    ];
    wallpaper =
    [
      "${mainMonitor}, ${wallpaperOne}"
      "${bottomMonitor}, ${wallpaperTwo}"
      "${sideMonitor}, ${wallpaperthree}"
    ];
  };
  programs.hyprlock.settings.background =
  {
    path = "${lockedWallpaper}";
    zindex = -2;
  };
}
