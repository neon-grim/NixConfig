{config, ...}:
let
  # Main Monitor Config
  mainMonName = config.desktop.mainMon.desc;
  mainMonWidth = config.desktop.mainMon.width;
  mainMonHeight = config.desktop.mainMon.height;
  mainMonMidHz = config.desktop.mainMon.midHz;
  mainMonMaxHz = config.desktop.mainMon.maxHz;
  mainMonPosX = config.desktop.mainMon.posX;
  mainMonPosY = config.desktop.mainMon.posY;
  MainMonPaper = config.desktop.mainMon.paperOne;
  # Side Monitor Config
  sideMonName = "Acer Technologies ED323QUR Unknown";
  sideMonPosX = "5120";
  sideMonPosY = "0";
  sideMonPaper = "~/Pictures/Background/Uncompressed/instrument.png";
  # Buttom Monitor Config
  buttomMonName = "Invalid Vendor Codename - RTK Verbatim MT14 demoset-1";
  buttomMonPosX = "1600";
  buttomMonPosY = "2080";
  buttomMonPaper = "~/Pictures/Background/Uncompressed/red_transistor.png";
  # Lockscreen
  lockedWallpaper = "~/Pictures/Background/Uncompressed/evangelion.png";
in
{
  imports =
  [
    ./mainMonitor.nix
  ];
  # Hyprland monitor config
  wayland.windowManager.hyprland.settings.monitor =
  [
    "desc:${mainMonName}, ${mainMonWidth}x${mainMonHeight}@${mainMonMidHz}, ${mainMonPosX}x${mainMonPosY}, 1"
    "desc:${sideMonName}, preferred, ${sideMonPosX}x${sideMonPosY}, 1, transform, 1"
    "desc:${buttomMonName}, preferred, ${buttomMonPosX}x${buttomMonPosY}, 1"
  ];
  # Niri monitor config
  desktop.niri.outputs =
  ''
    output "${mainMonName}" {
      mode "${mainMonWidth}x${mainMonHeight}@${mainMonMaxHz}"
      position x=${mainMonPosX} y=${mainMonPosY}
      variable-refresh-rate on-demand=true
    }
    output "${sideMonName}" {
      position x=${sideMonPosX} y=${sideMonPosY}
      transform "90"
    }
    output "${buttomMonName}" {
      position x=${buttomMonPosX} y=${buttomMonPosY}
    }
  '';
  # Sesion Lock manager
  programs.hyprlock.settings.background =
  {
    path = "${lockedWallpaper}";
    zindex = -2;
  };
}
