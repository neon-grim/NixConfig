{pkgs, lib, inputs, config, ...}:
let
  hyprctl = "${lib.getExe' inputs.hyprland.packages.x86_64-linux.hyprland "hyprctl"} -i 0";
  mainMonitor = "desc:Samsung Electric Company Odyssey G95SC H1AK500000";
  notifySend = lib.getExe pkgs.libnotify;
  hyprlandScript = pkgs.writeShellScriptBin "hyprTweaks"
  ''
  adaptiveSync=false
  bitdepth=false
  maxRefreshRate=false
  reloadHyprland=false
  
  hyprCommand="keyword animations:enabled false;"
  hyprCommand+=" keyword decoration:blur:enabled false;"
  hyprCommand+=" keyword decoration:drop_shadow false;"
  
  while getopts ":abdmr" opt; do
    case $opt in
      a)
        adaptiveSync=true
        hyprCommand+=" keyword cursor:min_refresh_rate 0;"
        hyprCommand+=" keyword cursor:no_break_fs_vrr true;"
        hyprCommand+=" keyword cursor:no_hardware_cursors true;"
        hyprCommand+=" keyword general:allow_tearing true;"
        ;;
      b)
        bitdepth=true
        ;;
      d)
        hyprCommand+=" keyword render:direct_scanout true;"
        ;;
      m)
        maxRefreshRate=true
        ;;
      r)
        reloadHyprland=true
        ;;
      ?)
        echo 'Unknown paramter'
        exit 1
        ;;
    esac
  done
  
  if $reloadHyprland; then
    hyprctl reload
    exit 0
  fi
  
  monConfig="monitor ${mainMonitor}"
  
  if $maxRefreshRate; then
    monConfig+=", 5120x1440@240.00, 1440x640, 1"
  else
    monConfig+=", 5120x1440@120.00, 1440x640, 1"
  fi
  
  if $adaptiveSync; then
    monConfig+=", vrr, 2"
  fi
  
  if $bitdepth; then
    monConfig+=", bitdepth, 10"
  fi
  
  if $maxRefreshRate || $adaptiveSync || $bitdepth; then
    hyprCommand+=" keyword $monConfig;"
  fi
  
  hyprctl --batch $hyprCommand
  
  sleep 20s
  '';
in
{
  home.packages = with pkgs; [hyprlandScript];
}