{config, ...}:
let
  # Main Monitor config
  mainMonitorWidth = "5120";
  mainMonitorHeight = "1440";
  mainMonitorPos = "0x640";
  defaultRefreshRate = "120.00";
  # Monitor Names
  mainMonitor = "desc:Samsung Electric Company Odyssey G95SC H1AK500000";
  bottomMonitor = "desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1";
  sideMonitor = "desc:Acer Technologies ED323QUR";
  # Monitor Wallpaper
  wallpaperOne = "~/Pictures/Background/Superwide/Death_Superwide.png";
  wallpaperTwo = "~/Pictures/Background/Uncompressed/red_transistor.png";
  wallpaperthree = "~/Pictures/Background/Uncompressed/instrument.png";
  wallpaperGaming = "~/Pictures/Background/Superwide/gaming_wallpaper.png";
  lockedWallpaper = "~/Pictures/Background/Uncompressed/evangelion.png";
in
{
  desktop.system.mainMon =
  {
    name = "DP-1";
    desc = mainMonitor;
    width = mainMonitorWidth;
    height = mainMonitorHeight;
    pos = mainMonitorPos;
    maxHz = "240.00";
    midHz = defaultRefreshRate;
    lowHz = "60.00";
    paperOne = wallpaperOne;
    paperTwo =  wallpaperGaming;
  };
  wayland.windowManager.hyprland.settings.monitor =
  [
    "${mainMonitor}, ${mainMonitorWidth}x${mainMonitorHeight}@${defaultRefreshRate}, ${mainMonitorPos}, 1"
    "${bottomMonitor}, preferred, 1600x2080, 1"
    "${sideMonitor}, preferred, 5120x0, 1, transform, 1"
    ", preferred, auto, 1"
  ];
  services.hyprpaper.settings =
  {
    preload =
    [
      "${wallpaperOne}"
      "${wallpaperTwo}"
      "${wallpaperthree}"
      "${wallpaperGaming}"
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
