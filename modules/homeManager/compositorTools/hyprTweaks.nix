{pkgs, lib, config, ...}:
let
  # App Executables
  dunstify = lib.getExe' pkgs.dunst "dunstify";
  hyprctl = lib.getExe' pkgs.hyprland "hyprctl";
  hyprpaper = lib.getExe pkgs.hyprpaper;
  xrandr = lib.getExe pkgs.xorg.xrandr;
  # Main Monitor Config
  mainMonName = config.desktop.mainMon.name;
  mainMonDesc = config.desktop.mainMon.desc;
  mainMonWidth = config.desktop.mainMon.width;
  mainMonHeight = config.desktop.mainMon.height;
  mainMonPosX = config.desktop.mainMon.posX;
  mainMonPosY = config.desktop.mainMon.posX;
  # Main Monitor supported Refreshrates
  maxHz = config.desktop.mainMon.maxHz;
  midHz = config.desktop.mainMon.midHz;
  lowHz = config.desktop.mainMon.lowHz;
  # Main Monitor Wallpapers
  paperOne = config.desktop.mainMon.paperOne;
  paperTwo = config.desktop.mainMon.paperTwo;
in
{
  home = lib.mkIf (config.desktop.system.compositors.hyprland.enable)
  {
    packages = with pkgs;
    [(
      writeShellScriptBin "hyprTweaks"
      ''
        function notify_error_and_exit()
        {
          value=$1
          exitCode=$2
          notifyGroup=$3
          errorMessage=$4
          
          if [[ "$value" == "" ]]; then
            ${dunstify} -u critical "$notifyGroup" "$errorMessage"
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
            "")
              echo "${maxHz}"
              ;;
            ?)
              echo "${maxHz}"
              ;;
          esac
        }
        
        function is_bool_set()
        {
          value=$1
          returnValue=$2
          
          if $value; then
            echo "$returnValue";
          fi  
        }
        
        function execute_command()
        {
          hyprCommand=$1
          paper=$2
          notifyGroup=$3
          notifyMessage=$4
          
          ${hyprctl} keyword "monitor ${mainMonDesc}, disable"
          
          sleep 2s
          
          ${hyprctl} --batch $hyprCommand
          
          sleep 2s
          
          ${hyprctl} dispatch focusmonitor ${mainMonDesc}
          
          ${xrandr} --output ${mainMonName} --primary
          
          ${hyprctl} "${hyprpaper} wallpaper ${mainMonDesc}, $paper"
          
          ${dunstify} -u normal "$notifyGroup" "$notifyMessage"
        }
        
        function reload_and_exit()
        {
          notifyGroup=$1
          hyprCommand="reload;"
          
          execute_command "$hyprCommand" "${paperOne}" "$notifyGroup" "Reloaded Hyprland"
        }
        
        adaptiveSync=false
        fullColorRange=false
        preferredHz=""
        reload=false
        
        hyprCommand="keyword animations:enabled false;"
        hyprCommand+="keyword decoration:blur:enabled false;"
        
        notifyGroup="HyprTweaks"
        notifyMessage="Tweaks on"
        
        notify_error_and_exit "${mainMonName}" "1" "$notifyGroup" "Missing Monitor Port!"
        notify_error_and_exit "${mainMonDesc}" "2" "$notifyGroup" "Missing Monitor Description!"
        notify_error_and_exit "${mainMonWidth}" "3" "$notifyGroup" "Missing Monitor Resolution!"
        notify_error_and_exit "${mainMonHeight}" "3" "$notifyGroup" "Missing Monitor Resolution!"
        notify_error_and_exit "${maxHz}" "4" "$notifyGroup" "Missing Monitor max Refreshrate!"
        notify_error_and_exit "${midHz}" "5" "$notifyGroup" "Missing Monitor mid Refreshrate!"
        notify_error_and_exit "${lowHz}" "6" "$notifyGroup" "Missing Monitor low Refreshrate!"
        notify_error_and_exit "${mainMonPosX}" "7" "$notifyGroup" "Missing Monitor Position!"
        notify_error_and_exit "${mainMonPosY}" "7" "$notifyGroup" "Missing Monitor Position!"
        notify_error_and_exit "${paperOne}" "8" "$notifyGroup" "Missing Monitor default Wallpaper!"
        notify_error_and_exit "${paperTwo}" "9" "$notifyGroup" "Missing Monitor gaming Wallpaper!"
        
        while getopts "p:adhnrst" opt; do
          case $opt in
            a)
              adaptiveSync=true
              notifyMessage+=", VRR"
              ;;
            d)
              hyprCommand+="keyword render:direct_scanout 0;"
              notifyMessage+=", DS off"
              ;;
            h)
              fullColorRange=true
              notifyMessage+=", 10bit"
              ;;
            n)
              hyprCommand+="keyword render:new_render_scheduling 1;"
              notifyMessage+=", NRS"
              ;;
            p)
              preferredHz=$OPTARG
              ;;
            r)
              reload_and_exit "$notifyGroup"
              exit 0
              ;;
            s)
              hyprCommand+="keyword cursor:no_hardware_cursors 1;"
              notifyMessage+=", HWC off"
              ;;
            t)
              hyprCommand+="keyword general:allow_tearing true;"
              notifyMessage+=", Tear"
              ;;
            ?)
              notify_error_and_exit "" "10" "$notifyGroup" "Unknown parameters!"
              ;;
          esac
        done
        
        refreshRate=$(set_refreshrate_string "$preferredHz")
        notifyMessage+=", $refreshRate Hz"
        
        monitorConfig="monitor ${mainMonDesc}, ${mainMonWidth}x${mainMonHeight}@$refreshRate, ${mainMonPosX}x${mainMonPosY}, 1"
        
        monitorConfig+=$(is_bool_set "$adaptiveSync"  ", vrr, 2")
        monitorConfig+=$(is_bool_set "$fullColorRange"  ", bitdepth, 10")
        
        hyprCommand+="keyword $monitorConfig;"
        
        execute_command "$hyprCommand" "${paperTwo}" "$notifyGroup" "$notifyMessage"
      ''
    )];
  };
}