{pkgs, config, ...}:
let
  # Main Monitor Config
  mainMonName = config.desktop.mainMon.desc;
  mainMonPort = config.desktop.mainMon.name;
  mainMonWidth = config.desktop.mainMon.width;
  mainMonHeight = config.desktop.mainMon.height;
  mainMonMidHz = config.desktop.mainMon.midHz;
  mainMonMaxHz = config.desktop.mainMon.maxHz;
  mainMonPosX = config.desktop.mainMon.posX;
  mainMonPosY = config.desktop.mainMon.posY;
  mainMonPaper = config.desktop.mainMon.paperOne;
  # Side Monitor Config
  sideMonName = "Acer Technologies ED323QUR";
  sideMonPort = "HDMI-A-2";
  sideMonPosX = "5120";
  sideMonPosY = "0";
  sideMonPaper = "~/Pictures/Background/Uncompressed/instrument.png";
  # Buttom Monitor Config
  buttomMonName = "Invalid Vendor Codename - RTK Verbatim MT14 demoset-1";
  buttomMonPort = "HDMI-A-1";
  buttomMonPosX = "1600";
  buttomMonPosY = "2080";
  buttomMonPaper = "~/Pictures/Background/Uncompressed/red_transistor.png";
  # Lockscreen
  lockedWallpaper = "~/Pictures/Background/Uncompressed/evangelion.png";
in
{
  desktop.system.workspaceCount = "10";
  # Hyprland monitor config
  wayland.windowManager.hyprland.settings =
  {
    monitor =
    [
      "desc:${mainMonName}, ${mainMonWidth}x${mainMonHeight}@${mainMonMidHz}, ${mainMonPosX}x${mainMonPosY}, 1"
      "desc:${sideMonName}, preferred, ${sideMonPosX}x${sideMonPosY}, 1, transform, 1"
      "desc:${buttomMonName}, preferred, ${buttomMonPosX}x${buttomMonPosY}, 1"
    ];
    workspace =
    [
      "1, border:false, rounding:false"
      "1, monitor:desc:${mainMonName}"
      "2, monitor:desc:${mainMonName}, persistent:true, default:true"
      "3, monitor:desc:${mainMonName}, persistent:true"
      "4, monitor:desc:${mainMonName}, persistent:true"
      "5, monitor:desc:${mainMonName}, persistent:true"
      "6, monitor:desc:${buttomMonName}, persistent:true, default:true"
      "7, monitor:desc:${buttomMonName}, persistent:true"
      "8, monitor:desc:${buttomMonName}, persistent:true"
      "9, monitor:desc:${sideMonName}, persistent:true, default:true"
      "10, monitor:desc:${sideMonName}, persistent:true"
    ];
  };
  # Niri Monitor Config
  desktop.niri.outputs =
  ''
    output "${mainMonName}" {
      mode "${mainMonWidth}x${mainMonHeight}@${mainMonMaxHz}"
      position x=${mainMonPosX} y=${mainMonPosY}
      variable-refresh-rate on-demand=true
      focus-at-startup
    }
    output "${sideMonName} Unknown" {
      position x=${sideMonPosX} y=${sideMonPosY}
      transform "90"
    }
    output "${buttomMonName}" {
      position x=${buttomMonPosX} y=${buttomMonPosY}
    }
  '';
  # Sesion Lock Manager
  programs.hyprlock.settings.background =
  {
    path = "${lockedWallpaper}";
    zindex = -2;
  };
  # Wallpaper Script
  home.packages = with pkgs;
  [(
    writeShellScriptBin "swaybgInit"
    ''
      swaybg -o ${mainMonPort} -m fit -i ${mainMonPaper} \
             -o ${sideMonPort} -m fill -i ${sideMonPaper} \
             -o ${buttomMonPort} -m fill -i ${buttomMonPaper} &
    ''
  )];
}
