{pkgs, lib, config, ...}:
let
    mainMod = "Super";
    mainModShift = "Super+Shift";
    mainModCtrl = "Super+Ctrl";
    mainModShiftCtrl = "Super+Shift+Ctrl";
    mainModAlt = "Super+Alt";
    mainModShiftAlt = "Super+Shift+Alt";
in
{
  desktop.niri.binds =
  let
    appBinds =
    ''
      ${mainModShift}+O { show-hotkey-overlay; }
      ${mainMod}+Escape allow-inhibiting=false                     { toggle-keyboard-shortcuts-inhibit; }
      ${mainMod}+Return hotkey-overlay-title="Terminal: Kitty"     { spawn "${lib.getExe pkgs.kitty}"; }
      ${mainMod}+E      hotkey-overlay-title="File Explorer: Nemo" { spawn "${lib.getExe' pkgs.nemo-with-extensions "nemo"}"; }
      ${mainMod}+R      hotkey-overlay-title="App Menu: Wofi"      { spawn-sh "pkill wofi; sleep 0.1 && wofi -S drun -I --width 500 --height 600"; }
      ${mainMod}+L      hotkey-overlay-title="Power Menu: Wofi"    { spawn-sh "pkill wofi; sleep 0.1 && wofiPowerMenu"; }
    '';
    appFocusBinds =
    ''
      ${mainMod}+Tab repeat=false    { toggle-overview; }
      ${mainMod}+q repeat=false      { close-window; }
      ${mainModShift}+V              { switch-focus-between-floating-and-tiling; }
      ${mainMod}+Home                { focus-column-first; }
      ${mainMod}+End                 { focus-column-last; }
      ${mainMod}+Right               { focus-column-right; }
      ${mainMod}+Left                { focus-column-left; }
      ${mainMod}+Up                  { focus-window-up; }
      ${mainMod}+Down                { focus-window-down; }
      ${mainMod}+WheelScrollRight    { focus-column-right; }
      ${mainMod}+WheelScrollLeft     { focus-column-left; }
      ${mainModCtrl}+WheelScrollUp   { focus-column-left; }
      ${mainModCtrl}+WheelScrollDown { focus-column-right; }
    '';
    appPositionBinds =
    ''
      ${mainMod}+C                        { center-column; }
      ${mainMod}+V                        { toggle-window-floating; }
      ${mainModShift}+Home                { move-column-to-first; }
      ${mainModShift}+End                 { move-column-to-last; }
      ${mainModShift}+Right               { move-column-right; }
      ${mainModShift}+Left                { move-column-left; }
      ${mainModShift}+Up                  { move-window-up; }
      ${mainModShift}+Down                { move-window-down; }
      ${mainModShift}+WheelScrollLeft     { move-column-left; }
      ${mainModShift}+WheelScrollRight    { move-column-right; }
      ${mainModShiftCtrl}+WheelScrollUp   { move-column-left; }
      ${mainModShiftCtrl}+WheelScrollDown { move-column-right; }
    '';
    appSizeBinds =
    ''
      ${mainMod}+D         { switch-preset-column-width; }
      ${mainModShift}+D    { expand-column-to-available-width; }
      ${mainModCtrl}+D     { maximize-column; }
      ${mainMod}+A         { set-column-width "50%"; }
      ${mainMod}+W         { switch-preset-window-height; }
      ${mainMod}+S         { reset-window-height; }
      ${mainMod}+F         { fullscreen-window; }
      ${mainModShift}+F    { toggle-windowed-fullscreen; }
      ${mainModCtrl}+Left  { consume-or-expel-window-left; }
      ${mainModCtrl}+Right { consume-or-expel-window-right; }
    '';
    monitorBinds =
    ''
      ${mainModAlt}+Right       { focus-monitor-right; }
      ${mainModAlt}+Left        { focus-monitor-left; }
      ${mainModAlt}+Up          { focus-monitor-up; }
      ${mainModAlt}+Down        { focus-monitor-down; }
      ${mainModShiftAlt}+Right  { move-column-to-monitor-right; }
      ${mainModShiftAlt}+Left   { move-column-to-monitor-left; }
      ${mainModShiftAlt}+Up     { move-column-to-monitor-up; }
      ${mainModShiftAlt}+Down   { move-column-to-monitor-down; }
      ${mainModShiftAlt}+Delete { power-off-monitors; }
    '';
    workspaceBinds =
    ''
      ${mainMod}+Page_Up                              { focus-workspace-up; }
      ${mainMod}+Page_Down                            { focus-workspace-down; }
      ${mainMod}+WheelScrollUp cooldown-ms=150        { focus-workspace-up; }
      ${mainMod}+WheelScrollDown cooldown-ms=150      { focus-workspace-down; }
      ${mainModShift}+Page_Up                         { move-column-to-workspace-up; }
      ${mainModShift}+Page_Down                       { move-column-to-workspace-down; }
      ${mainModShift}+WheelScrollUp cooldown-ms=150   { move-column-to-workspace-up; }
      ${mainModShift}+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
      ${mainModAlt}+Page_Up                           { move-workspace-up; }
      ${mainModAlt}+Page_Down                         { move-workspace-down; }
      ${mainModAlt}+WheelScrollUp cooldown-ms=150     { move-workspace-up; }
      ${mainModAlt}+WheelScrollDown cooldown-ms=150   { move-workspace-down; }
    '';
    screenshotBinds =
    ''
      ${mainMod}+P      { screenshot-screen; }
      ${mainModShift}+P { screenshot; }
      ${mainModCtrl}+P  { screenshot-window; }
    '';
    mediaBinds =
    ''
      XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"; }
      XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"; }
      XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
      XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }
      XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
      XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
      XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }
      XF86AudioRewind      allow-when-locked=true { spawn-sh "playerctl position 5-"; }
      XF86AudioForward     allow-when-locked=true { spawn-sh "playerctl position 5+"; }
    '';
  in
  "binds {"+
  appBinds+
  appFocusBinds+
  appPositionBinds+
  appSizeBinds+
  monitorBinds+
  workspaceBinds+
  screenshotBinds+
  mediaBinds+
  "}";
}