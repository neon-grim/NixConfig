{pkgs, host, ...}:
let
  # Wallpapers
  wallpaperOne = "/mnt/SATASSD1/1_Images/BackgroundImages/Superwide/Death_Superwide.png";
  wallpaperTwo = "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/red_transistor.png";
  wallpaperThree = "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/instrument.png";
  # Monitor names
  mainMonitorName = "desc:Samsung Electric Company Odyssey G95SC H1AK500000";
  bottomMonitorName = "desc:DO NOT USE - RTK Verbatim MT14 demoset-1";
  leftMonitorName = "desc:Acer Technologies ED323QUR";
in
{
  services.hyprpaper =
  {
    enable = true;
    settings =
    {
      splash = false;
      preload =
      [
        "${wallpaperOne}"
        "${wallpaperTwo}"
        "${wallpaperThree}"
      ];
      wallpaper =
      [
        "${mainMonitorName}, ${wallpaperOne}"
        "${bottomMonitorName}, ${wallpaperTwo}"
        "${leftMonitorName}, ${wallpaperThree}"
      ];
    };
  };
}