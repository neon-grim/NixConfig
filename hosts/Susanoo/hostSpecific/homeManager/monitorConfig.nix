{config, pkgs, ...}:
let
  # Main Monitor Config
  mainMonName = config.desktop.mainMon.desc;
  mainMonPort = config.desktop.mainMon.name;
  mainMonWidth = config.desktop.mainMon.width;
  mainMonHeight = config.desktop.mainMon.height;
  mainMonMaxHz = config.desktop.mainMon.maxHz;
  mainMonPosX = config.desktop.mainMon.posX;
  mainMonPosY = config.desktop.mainMon.posY;
  mainMonPaper = config.desktop.mainMon.paperOne;
  # Side Monitor Config
  sideMonName = "Samsung Electric Company U32J59x HTPK701828";
  sideMonPort = "DP-2";
  sideMonPosX = "0";
  sideMonPosY = "0";
  sideMonPaper = "~/Pictures/Wallpapers/DoomSlayerDTDA.png";
  # Lockscreen
  lockedWallpaper = "~/Pictures/Wallpapers/DoomSlayerDTDA.png";
in
{
  # Niri Monitor Config
  desktop.niri.outputs =
  ''
    output "${mainMonName}" {
      mode "${mainMonWidth}x${mainMonHeight}@${mainMonMaxHz}"
      position x=${mainMonPosX} y=${mainMonPosY}
      variable-refresh-rate on-demand=true
      focus-at-startup
      scale 1.0
    }
    output "${sideMonName}" {
      position x=${sideMonPosX} y=${sideMonPosY}
      scale 1.0
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
             -o ${sideMonPort} -m fill -i ${sideMonPaper} &
    ''
  )];
}
