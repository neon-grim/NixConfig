{
  # Hyprland
  monitorSetup =
  [
    "desc:Samsung Electric Company Odyssey G95SC H1AK500000, 5120x1440@120.00, 1440x640, 1"
    "desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1, preferred, 2720x2080, 1"
    "desc:Acer Technologies ED323QUR, preferred, 0x0, 1, transform, 3"
  ];
  monitorBinds =
  [
    "SUPER SHIFT, F1, exec, hyprctl keyword monitor desc:Samsung Electric Company Odyssey G95SC H1AK500000, 5120x1440@120.00, 1440x640, 1"
    "SUPER SHIFT, F2, exec, hyprctl keyword monitor desc:Samsung Electric Company Odyssey G95SC H1AK500000, 5120x1440@120.00, 1440x640, 1, vrr, 2"
    "SUPER SHIFT, F3, exec, hyprctl keyword monitor desc:Samsung Electric Company Odyssey G95SC H1AK500000, 5120x1440@240.00, 1440x640, 1, vrr, 2"
  ];
  # Hyprpaper
  preloadWallpaper =
  [
    "/mnt/SATASSD1/1_Images/BackgroundImages/Superwide/Death_Superwide.png"
    "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/red_transistor.png"
    "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/instrument.png"
  ];
  wallpaperConfig =
  [
    "desc:Samsung Electric Company Odyssey G95SC H1AK500000, /mnt/SATASSD1/1_Images/BackgroundImages/Superwide/Death_Superwide.png"
    "desc:Invalid Vendor Codename - RTK Verbatim MT14 demoset-1, /mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/red_transistor.png"
    "desc:Acer Technologies ED323QUR, /mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/instrument.png"
  ];
  # Hyprlock
  lockWallpaper = "/mnt/SATASSD1/1_Images/BackgroundImages/Uncompressed/evangelion.png";
}