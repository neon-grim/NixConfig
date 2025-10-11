{pkgs, lib, config, ...}:
let
  # App Executables
  dunstify = lib.getExe' pkgs.dunst "dunstify";
  hyprctl = lib.getExe' pkgs.hyprland "hyprctl";
  xrandr = lib.getExe pkgs.xorg.xrandr;
  # Main Monitor Config
  mainMonName = config.desktop.system.mainMon.name;
  mainMonDesc = config.desktop.system.mainMon.desc;
  mainMonRes = config.desktop.system.mainMon.res;
  mainMonPos = config.desktop.system.mainMon.pos;
  # Main Monitor supported Refreshrates
  maxHz = config.desktop.system.mainMon.maxHz;
  midHz = config.desktop.system.mainMon.midHz;
  lowHz = config.desktop.system.mainMon.lowHz;
  # Main Monitor Wallpapers
  paperOne = config.desktop.system.mainMon.paperOne;
  paperTwo = config.desktop.system.mainMon.paperTwo;
in
{
  home.packages = with pkgs;
  [(
    writeShellScriptBin "hyprTweaks"
    ''
      function notify_error_and_exit()
      {
        value=$1
        exitCode=$2
        notifyGroup=$3
        notifyMessage=$4
        
        if [[ "${value}" == "" ]]; then
          ${dunstify} -u critical "$notifyGroup" "$notifyMessage"
          exit $exitCode
        fi
      }
      
      function set_refreshrate_string()
      {
        preferredHz=$1
        
        case $preferredHz in
          mid)
            echo "${midHz}"
            ;;
          low)
            echo "${lowHz}"
            ;;
          ?)
            echo "${maxHz}"
            ;;
        esac
      }
      
      function execute_command()
      {
        hyprCommand=$1
        notifyGroup=$2
        notifyMessage=$3
        
        ${hyprctl} keyword "monitor ${mainMonDesc}, disable"
        
        sleep 2s
        
        ${hyprctl} --batch $hyprCommand
        
        sleep 2s
        
        ${hyprctl} dispatch focusmonitor ${mainMonDesc}
        
        ${xrandr} --output ${mainMonName} --primary
        
        ${dunstify} -u normal "$notifyGroup" "$notifyMessage"
      }
      
      function reload_and_exit()
      {
        notifyGroup=$1
        hyprCommand="reload;"
        hyprCommand+="hyprpaper wallpaper ${mainMonDesc}, ${paperOne};"
        
        execute_command "$hyprCommand" "$notifyGroup" "Reloaded Hyprland"
        
        exit 0
      }
      
      adaptiveSync=false
      fullColorRange=false
      refreshRate=""
      reload=false
      
      hyprCommand="keyword animations:enabled false;"
      hyprCommand+="keyword decoration:blur:enabled false;"
      
      notifyGroup="HyprTweaks"
      notifyMessage="Tweaks on"
      
      notify_error_and_exit "${mainMonName}" "1" "$notifyGroup" "Missing Monitor Port!"
      notify_error_and_exit "${mainMonDesc}" "2" "$notifyGroup" "Missing Monitor Description!"
      notify_error_and_exit "${mainMonRes}" "3" "$notifyGroup" "Missing Monitor Resolution!"
      notify_error_and_exit "${maxHz}" "4" "$notifyGroup" "Missing Monitor max Refreshrate!"
      notify_error_and_exit "${midHz}" "5" "$notifyGroup" "Missing Monitor mid Refreshrate!"
      notify_error_and_exit "${lowHz}" "6" "$notifyGroup" "Missing Monitor low Refreshrate!"
      notify_error_and_exit "${mainMonPos}" "7" "$notifyGroup" "Missing Monitor Position!"
      notify_error_and_exit "${paperOne}" "8" "$notifyGroup" "Missing Monitor default Wallpaper!"
      notify_error_and_exit "${paperTow}" "9" "$notifyGroup" "Missing Monitor gaming Wallpaper!"
      
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
            refreshRate=$(set_refreshrate_string "$OPTARG")
            notifyMessage+=", $refreshRate Hz"
            ;;
          r)
            reload_and_exit "$notifyGroup"
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
            notify_error_and_exit "" "10" "$notifyGroup" "Unknown parameters!"
            ;;
        esac
      done
      
      monitorConfig="monitor ${mainMonDesc}, ${mainMonRes}@$refreshRate, ${mainMonPos}, 1"
      
      monitorConfig+=$($adaptiveSync && echo ", vrr, 2" || echo "")
      monitorConfig+=$($fullColorRange && echo ", bitdepth, 10" || echo "")
      
      hyprCommand+="keyword $monitorConfig;"
      hyprCommand+="hyprpaper wallpaper ${mainMonDesc}, ${paperTow};"
      
      execute_command "$hyprCommand" "$notifyGroup" "$notifyMessage"
    ''
  )];
}