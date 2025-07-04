{pkgs, lib, config, ...}:
let
  dunstify = lib.getExe' pkgs.dunst "dunstify";
  hyprctl = lib.getExe' pkgs.hyprland "hyprctl";
  xrandr = lib.getExe pkgs.xorg.xrandr;
  mainMonName = config.desktop.system.mainMon.name;
  mainMonRes = config.desktop.system.mainMon.res;
  maxHz = config.desktop.system.mainMon.maxHz;
  midHz = config.desktop.system.mainMon.midHz;
  lowHz = config.desktop.system.mainMon.lowHz;
  mainMonPos = config.desktop.system.mainMon.pos;
in
{
  home.packages = with pkgs;
  [(
    writeShellScriptBin "hyprTweaks"
    ''
      function set_config()
      {
        hyprCommand=$1
        notifyGroup=$2
        notifyMessage=$3
        
        ${hyprctl} keyword "monitor ${mainMonName}, disable"
        
        sleep 5s
        
        ${hyprctl} --batch $hyprCommand
        
        sleep 5s
        
        ${hyprctl} dispatch focusmonitor ${mainMonName}
        
        ${xrandr} --output ${mainMonName} --primary
        
        ${dunstify} -u normal "$notifyGroup" "$notifyMessage"
      }
      
      adaptiveSync=false
      fullColorRange=false
      reload=false
      preferredHz=""
      
      hyprCommand="keyword animations:enabled false;"
      hyprCommand+=" keyword decoration:blur:enabled false;"
      
      notifyGroup="HyprTweaks"
      notifyMessage="Tweaks on"
      
      if [[ "${mainMonName}" == "" || "${mainMonRes}" == "" || "${maxHz}" == "" || "${midHz}" == "" || "${lowHz}" == "" || "${mainMonPos}" == "" ]]; then
        ${dunstify} -u critical "$notifyGroup" "Missing main monitor config!"
        exit 1
      fi
      
      while getopts "p:adhrst" opt; do
        case $opt in
          a)
            adaptiveSync=true
            notifyMessage+=", VRR"
            ;;
          d)
            hyprCommand+=" keyword render:direct_scanout 1;"
            notifyMessage+=", DS"
            ;;
          h)
            fullColorRange=true
            notifyMessage+=", 10bit"
            ;;
          p)
            preferredHz=$OPTARG
            ;;
          r)
            reload=true
            preferredHz="mid"
            notifyMessage="Reloaded Hyprland"
            ;;
          s)
            hyprCommand+=" keyword cursor:no_hardware_cursors 1;"
            notifyMessage+=", SC"
            ;;
          t)
            hyprCommand+=" keyword general:allow_tearing true;"
            notifyMessage+=", Tear"
            ;;
          ?)
            ${dunstify} -u critical "$notifyGroup" "Unknown parameters!"
            exit 2
            ;;
        esac
      done
      
      refreshRate="${maxHz}"
      refreshRate=$([[ $preferredHz == "mid" ]] && echo "${midHz}" || echo $refreshRate)
      refreshRate=$([[ $preferredHz == "low" ]] && echo "${lowHz}" || echo $refreshRate)
      
      notifyMessage+=", $refreshRate Hz"
      
      monitorConfig="monitor ${mainMonName}, ${mainMonRes}@$refreshRate, ${mainMonPos}, 1"
      
      $reload && ${hyprctl} reload && set_config "keyword $monitorConfig;" "$notifyGroup" "reloaded hyprland" && exit 0
      
      monitorConfig+=$($adaptiveSync && echo ", vrr, 2" || echo "")
      monitorConfig+=$($fullColorRange && echo ", bitdepth, 10" || echo "")
      hyprCommand+=$($adaptiveSync || $bitdepth && echo " keyword $monitorConfig;" || echo "")
      
      set_config "$hyprCommand" "$notifyGroup" "$notifyMessage"
    ''
  )];
}