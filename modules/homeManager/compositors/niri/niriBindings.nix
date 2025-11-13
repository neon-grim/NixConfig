{pkgs, lib, ...}:
let
    mainMod = "Super";
    mainModShift = "Super+Shift";
    MainModCtrl = "Super+Ctrl";
    MainModAlt = "Super+Alt";
    mainModShiftAlt = "Super+Shift+Alt";
    MainModCtrlAlt = "Super+Ctrl+Alt";
in
{
  desktop.niri.binds =
  ''
    binds {
      ${mainModShift}+o { show-hotkey-overlay; }
      
      ${mainMod}+Return hotkey-overlay-title="Open a Terminal: Kitty" { spawn "${lib.getExe pkgs.kitty}"; }
      ${mainMod}+E hotkey-overlay-title="Open a File Explorer: Nemo" { spawn "${lib.getExe' pkgs.nemo-with-extensions "nemo"}"; }
      
      ${mainMod}+R hotkey-overlay-title="Run an Application: Wofi" { spawn-sh "pkill wofi; sleep 0.1 && wofi -S drun -I --width 500 --height 600"; }
      ${mainMod}+L hotkey-overlay-title="Power Menu: Wofi" { spawn-sh "pkill wofi; sleep 0.1 && wofiPowerMenu"; }
      
      XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"; }
      XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"; }
      XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
      XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }
      XF86AudioPlay     allow-when-locked=true { spawn-sh "playerctl play-pause"; }
      XF86AudioPrev     allow-when-locked=true { spawn-sh "playerctl previous"; }
      XF86AudioNext     allow-when-locked=true { spawn-sh "playerctl next"; }
      XF86AudioRewind     allow-when-locked=true { spawn-sh "playerctl position 5-"; }
      XF86AudioForward     allow-when-locked=true { spawn-sh "playerctl position 5+"; }
      
      ${mainMod}+Tab repeat=false { toggle-overview; }
      ${mainMod}+q repeat=false { close-window; }
      
      ${mainMod}+Right { focus-column-right; }
      ${mainMod}+Left  { focus-column-left; }
      ${mainMod}+Up    { focus-window-up; }
      ${mainMod}+Down  { focus-window-down; }
      
      ${mainModShift}+Right { move-column-right; }
      ${mainModShift}+Left  { move-column-left; }
      ${mainModShift}+Up    { move-window-up; }
      ${mainModShift}+Down  { move-window-down; }
      
      ${mainMod}+Home { focus-column-first; }
      ${mainMod}+End  { focus-column-last; }
      ${mainModShift}+Home { move-column-to-first; }
      ${mainModShift}+End  { move-column-to-last; }
      
      ${mainModAlt}+Right { focus-monitor-right; }
      ${mainModAlt}+Left  { focus-monitor-left; }
      ${mainModAlt}+Up    { focus-monitor-up; }
      ${mainModAlt}+Down  { focus-monitor-down; }
      
      ${mainModCtrl}+Right { move-column-to-monitor-right; }
      ${mainModCtrl}+Left  { move-column-to-monitor-left; }
      ${mainModCtrl}+Up    { move-column-to-monitor-up; }
      ${mainModCtrl}+Down  { move-column-to-monitor-down; }
      
      ${mainMod}+Page_Up        { focus-workspace-up; }
      ${mainMod}+Page_Down      { focus-workspace-down; }
      ${mainModShift}+Page_Up   { move-column-to-workspace-up; }
      ${mainModShift}+Page_Down { move-column-to-workspace-down; }
      
      ${mainModCtrl}+Page_Up   { move-workspace-up; }
      ${mainModCtrl}+Page_Down { move-workspace-down; }
      
      ${mainMod}+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
      ${mainMod}+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
      ${mainModShift}+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }
      ${mainModShift}+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
      
      ${mainMod}+WheelScrollRight      { focus-column-right; }
      ${mainMod}+WheelScrollLeft       { focus-column-left; }
      ${mainModShift}+WheelScrollRight { move-column-right; }
      ${mainModShift}+WheelScrollLeft  { move-column-left; }
      
      ${mainModAlt}+WheelScrollUp        { focus-column-left; }
      ${mainModAlt}+WheelScrollDown      { focus-column-right; }
      ${MainModCtrlAlt}+WheelScrollUp   { move-column-left; }
      ${MainModCtrlAlt}+WheelScrollDown { move-column-right; }
      
      ${mainMod}+1 { focus-workspace 1; }
      ${mainMod}+2 { focus-workspace 2; }
      ${mainMod}+3 { focus-workspace 3; }
      ${mainMod}+4 { focus-workspace 4; }
      ${mainMod}+5 { focus-workspace 5; }
      ${mainMod}+6 { focus-workspace 6; }
      ${mainMod}+7 { focus-workspace 7; }
      ${mainMod}+8 { focus-workspace 8; }
      ${mainMod}+9 { focus-workspace 9; }
      ${mainModShift}+1 { move-column-to-workspace 1; }
      ${mainModShift}+2 { move-column-to-workspace 2; }
      ${mainModShift}+3 { move-column-to-workspace 3; }
      ${mainModShift}+4 { move-column-to-workspace 4; }
      ${mainModShift}+5 { move-column-to-workspace 5; }
      ${mainModShift}+6 { move-column-to-workspace 6; }
      ${mainModShift}+7 { move-column-to-workspace 7; }
      ${mainModShift}+8 { move-column-to-workspace 8; }
      ${mainModShift}+9 { move-column-to-workspace 9; }
      
      ${mainModShiftAlt}+Left  { consume-or-expel-window-left; }
      ${mainModShiftAlt}+Right { consume-or-expel-window-right; }
      
      ${mainModShiftAlt}+Up  { consume-window-into-column; }
      ${mainModShiftAlt}+Down { expel-window-from-column; }
      
      ${mainMod}+W { switch-preset-column-width; }
      ${mainModShift}+W { switch-preset-window-height; }
      ${mainMod}+S { reset-window-height; }
      ${mainMod}+F { maximize-column; }
      ${mainModShift}+F { fullscreen-window; }
      
      ${mainModCtrl}+F { expand-column-to-available-width; }
      
      ${mainMod}+C { center-column; }
      ${mainModShift}+C { center-visible-columns; }
      
      ${mainMod}+V       { toggle-window-floating; }
      ${mainModShift}+V { switch-focus-between-floating-and-tiling; }
      
      ${mainMod}+Print { screenshot-screen; }
      ${mainModShift}+Print { screenshot; }
      ${mainModCtrl}+Print { screenshot-window; }
      
      ${mainMod}+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
      
      ${mainModShift}+L { quit; }
      ${mainModShiftAlt}+P { power-off-monitors; }
    }
  '';
}