{...}:
let
  mainMonitor = "desc:Samsung Electric Company Odyssey G95SC H1AK500000";
  bottomMonitor = "desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1";
  sideMonitor = "desc:Acer Technologies ED323QUR, preferred";
  wallpaperOne = "/mnt/SATASSD1/1_Images/BackgroundImages/Superwide/Death_Superwide.png";
  wallpaperTwo = "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/red_transistor.png";
  wallpaperthree = "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/instrument.png";
  lockedWallpaper = "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/evangelion.png";
in
{
  
  wayland.windowManager.hyprland.settings.monitor =
  [
    "${mainMonitor}, 5120x1440@120.00, 1440x640, 1"
    "${bottomMonitor}, preferred, 2720x2080, 1"
    "${sideMonitor}, 0x0, 1, transform, 3"
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
