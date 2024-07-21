{pkgs, host, ...}:
let
  preloadWallpaper =
  [
    "/mnt/SATASSD1/1_Images/BackgroundImages/Superwide/Death_Superwide.png"
    "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/red_transistor.png"
    "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/instrument.png"
  ];
  wallpaperConfig =
  [
    "desc:Samsung Electric Company Odyssey G95SC H1AK500000, /mnt/SATASSD1/1_Images/BackgroundImages/Superwide/Death_Superwide.png"
    "desc:DO NOT USE - RTK Verbatim MT14 demoset-1, /mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/red_transistor.png"
    "desc:Acer Technologies ED323QUR, /mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/instrument.png"
  ];
in
{
  services.hyprpaper =
  {
    enable = true;
    settings =
    {
      splash = false;
      preload = preloadWallpaper;
      wallpaper = wallpaperConfig;
    };
  };
}