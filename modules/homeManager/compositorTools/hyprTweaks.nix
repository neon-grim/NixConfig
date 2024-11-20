{pkgs, lib, config, ...}:
let
  dunstify = lib.getExe' pkgs.dunst "dunstify";
  hyprctl = lib.getExe' pkgs.hyprland "hyprctl";
  xrandr = lib.getExe pkgs.xorg.xrandr;
  mainMonName = config.desktop.system.mainMon.name;
  mainMonRes = config.desktop.system.mainMon.res;
  mainMonOc = config.desktop.system.mainMon.oc;
  mainMonPos = config.desktop.system.mainMon.pos;
in
{
  home.packages = with pkgs;
  [(
    writeShellScriptBin "hyprTweaks"
    ''
      adaptiveSync=false
      fullColorRange=false
      
      hyprCommand="keyword animations:enabled false;"
      hyprCommand+=" keyword decoration:blur:enabled false;"
      hyprCommand+=" keyword general:allow_tearing true;"
      
      notifyGroup="Hyprland Tweaks"
      notifyMessage="Tweaks on:"
      
      if [[ "${mainMonName}" == "" || "${mainMonRes}" == "" || "${mainMonOc}" == "" || "${mainMonPos}" == "" ]]; then
        ${dunstify} -u critical "$notifyGroup" "Missing main monitor config!"
        exit 1
      fi
      
      monitorConfig="monitor ${mainMonName}, ${mainMonRes}@${mainMonOc}, ${mainMonPos}, 1"
      
      while getopts ":acdhpr" opt; do
        case $opt in
          a)
            adaptiveSync=true
            notifyMessage+=" VRR"
            ;;
          c)
            hyprCommand+=" keyword cursor:min_refresh_rate 0;"
            hyprCommand+=" keyword cursor:no_break_fs_vrr true;"
            hyprCommand+=" keyword cursor:no_hardware_cursors true;"
            notifyMessage+=" SC"
            ;;
          d)
            hyprCommand+=" keyword render:direct_scanout true;"
            notifyMessage+=" DS"
            ;;
          h)
            fullColorRange=true
            notifyMessage+=" 10Bit"
            ;;
          p)
            monitorConfig="monitor ${mainMonName}, preferred, ${mainMonPos}, 1"
            notifyMessage+=" preferred"
            ;;
          r)
            ${hyprctl} reload
            ${dunstify} -u normal "$notifyGroup" "Reloaded Hyprland."
            exit 0
            ;;
          ?)
            ${dunstify} -u critical "$notifyGroup" "Unknown parameters!"
            exit 2
            ;;
        esac
      done
      
      if $adaptiveSync; then
        monitorConfig+=", vrr, 2"
      fi
      
      if $fullColorRange; then
        monitorConfig+=", bitdepth, 10"
      fi
      
      if $maxRefreshRate || $adaptiveSync || $bitdepth; then
        hyprCommand+=" keyword $monitorConfig;"
      fi
      
      ${hyprctl} keyword "monitor ${mainMonName}, disable"
      
      sleep 5s
      
      ${hyprctl} --batch $hyprCommand
      
      ${dunstify} -u normal "$notifyGroup" "$notifyMessage"
      
      sleep 15s
      
      ${xrandr} --output ${mainMonName} --primary
      
      ${dunstify} -u normal "$notifyGroup" "Xwayland primary: ${mainMonName}"
    ''
  )];
}