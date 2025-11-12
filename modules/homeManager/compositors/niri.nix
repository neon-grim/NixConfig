{pkgs, config, lib, ...}:
{
  home.file.".config/niri/config.kdl".text =
  ''
spawn-at-startup "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
spawn-at-startup "${lib.getExe' pkgs.blueman "blueman-applet"}"
spawn-at-startup "${lib.getExe' pkgs.networkmanagerapplet "nm-applet"} --indicator"
spawn-at-startup "${lib.getExe pkgs.dunst}"
spawn-at-startup "${lib.getExe pkgs.waybar}"

input {
  keyboard {
    numlock
  }
  mouse {
    accel-speed 1
    accel-profile "flat"
  }
  warp-mouse-to-focus
  focus-follows-mouse max-scroll-amount="0%"
}

output "Samsung Electric Company Odyssey G95SC H1AK500000" {
  mode "5120x1440@239.999"
  variable-refresh-rate on-demand=true
  scale 1
  transform "normal"
  position x=0 y=640
}

output "Acer Technologies ED323QUR Unknown" {
  scale 1
  transform "90"
  position x=5120 y=0
}

output "Invalid Vendor Codename - RTK Verbatim MT14 demoset-1" {
  scale 1
  transform "normal"
  position x=1600 y=2080
}

layout {
  gaps 4
  center-focused-column "never"
  
  preset-column-widths {
    proportion 0.33333
    proportion 0.5
    proportion 0.66667
  }
  
  default-column-width { 
    proportion 0.5 
  }
  
  focus-ring {
    width 2
    active-color "#7fc8ff"
    inactive-color "#505050"
  }
  struts {
    // left 64
    // right 64
    // top 64
    // bottom 64
  }
}

hotkey-overlay {
  skip-at-startup
}

prefer-no-csd

screenshot-path "~/Pictures/Screenshots/Screenshot_from_%Y-%m-%d %H-%M-%S.png"

window-rule {
  match app-id=r#"^steam_app_.*$"#
  open-fullscreen true
  variable-refresh-rate true
}

window-rule {
  match app-id=r#"^org\.wezfurlong\.wezterm$"#
  default-column-width {}
}

window-rule {
  match app-id=r#"librewolf$"# title="^Picture-in-Picture$"
  open-floating true
}

window-rule {
    geometry-corner-radius 4
    clip-to-geometry true
}

binds {
  Super+Shift+Slash { show-hotkey-overlay; }

  Super+Return hotkey-overlay-title="Open a Terminal: Kitty" { spawn "${lib.getExe pkgs.kitty}"; }
  Super+D hotkey-overlay-title="Run an Application: fuzzel" { spawn-sh "pkill wofi; sleep 0.1 && wofi -S drun -I --width 500 --height 600"; }
  Super+Alt+L hotkey-overlay-title="Lock the Screen: swaylock" { spawn "swaylock"; }

  XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"; }
  XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"; }
  XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
  XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }
  XF86AudioPlay     allow-when-locked=true { spawn-sh "playerctl play-pause"; }
  XF86AudioPrev     allow-when-locked=true { spawn-sh "playerctl previous"; }
  XF86AudioNext     allow-when-locked=true { spawn-sh "playerctl next"; }
  XF86AudioRewind     allow-when-locked=true { spawn-sh "playerctl position 5-"; }
  XF86AudioForward     allow-when-locked=true { spawn-sh "playerctl position 5+"; }

  Super+O repeat=false { toggle-overview; }

  Super+Q repeat=false { close-window; }

  Super+Left  { focus-column-left; }
  Super+Down  { focus-window-down; }
  Super+Up    { focus-window-up; }
  Super+Right { focus-column-right; }
  Super+H     { focus-column-left; }
  Super+J     { focus-window-down; }
  Super+K     { focus-window-up; }
  Super+L     { focus-column-right; }

  Super+Ctrl+Left  { move-column-left; }
  Super+Ctrl+Down  { move-window-down; }
  Super+Ctrl+Up    { move-window-up; }
  Super+Ctrl+Right { move-column-right; }
  Super+Ctrl+H     { move-column-left; }
  Super+Ctrl+J     { move-window-down; }
  Super+Ctrl+K     { move-window-up; }
  Super+Ctrl+L     { move-column-right; }

  Super+Home { focus-column-first; }
  Super+End  { focus-column-last; }
  Super+Ctrl+Home { move-column-to-first; }
  Super+Ctrl+End  { move-column-to-last; }

  Super+Shift+Left  { focus-monitor-left; }
  Super+Shift+Down  { focus-monitor-down; }
  Super+Shift+Up    { focus-monitor-up; }
  Super+Shift+Right { focus-monitor-right; }
  Super+Shift+H     { focus-monitor-left; }
  Super+Shift+J     { focus-monitor-down; }
  Super+Shift+K     { focus-monitor-up; }
  Super+Shift+L     { focus-monitor-right; }

  Super+Shift+Ctrl+Left  { move-column-to-monitor-left; }
  Super+Shift+Ctrl+Down  { move-column-to-monitor-down; }
  Super+Shift+Ctrl+Up    { move-column-to-monitor-up; }
  Super+Shift+Ctrl+Right { move-column-to-monitor-right; }
  Super+Shift+Ctrl+H     { move-column-to-monitor-left; }
  Super+Shift+Ctrl+J     { move-column-to-monitor-down; }
  Super+Shift+Ctrl+K     { move-column-to-monitor-up; }
  Super+Shift+Ctrl+L     { move-column-to-monitor-right; }

  Super+Page_Down      { focus-workspace-down; }
  Super+Page_Up        { focus-workspace-up; }
  Super+U              { focus-workspace-down; }
  Super+I              { focus-workspace-up; }
  Super+Ctrl+Page_Down { move-column-to-workspace-down; }
  Super+Ctrl+Page_Up   { move-column-to-workspace-up; }
  Super+Ctrl+U         { move-column-to-workspace-down; }
  Super+Ctrl+I         { move-column-to-workspace-up; }

  Super+Shift+Page_Down { move-workspace-down; }
  Super+Shift+Page_Up   { move-workspace-up; }
  Super+Shift+U         { move-workspace-down; }
  Super+Shift+I         { move-workspace-up; }

  Super+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
  Super+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
  Super+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
  Super+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

  Super+WheelScrollRight      { focus-column-right; }
  Super+WheelScrollLeft       { focus-column-left; }
  Super+Ctrl+WheelScrollRight { move-column-right; }
  Super+Ctrl+WheelScrollLeft  { move-column-left; }

  Super+Shift+WheelScrollDown      { focus-column-right; }
  Super+Shift+WheelScrollUp        { focus-column-left; }
  Super+Ctrl+Shift+WheelScrollDown { move-column-right; }
  Super+Ctrl+Shift+WheelScrollUp   { move-column-left; }

  Super+1 { focus-workspace 1; }
  Super+2 { focus-workspace 2; }
  Super+3 { focus-workspace 3; }
  Super+4 { focus-workspace 4; }
  Super+5 { focus-workspace 5; }
  Super+6 { focus-workspace 6; }
  Super+7 { focus-workspace 7; }
  Super+8 { focus-workspace 8; }
  Super+9 { focus-workspace 9; }
  Super+Ctrl+1 { move-column-to-workspace 1; }
  Super+Ctrl+2 { move-column-to-workspace 2; }
  Super+Ctrl+3 { move-column-to-workspace 3; }
  Super+Ctrl+4 { move-column-to-workspace 4; }
  Super+Ctrl+5 { move-column-to-workspace 5; }
  Super+Ctrl+6 { move-column-to-workspace 6; }
  Super+Ctrl+7 { move-column-to-workspace 7; }
  Super+Ctrl+8 { move-column-to-workspace 8; }
  Super+Ctrl+9 { move-column-to-workspace 9; }

  Super+BracketLeft  { consume-or-expel-window-left; }
  Super+BracketRight { consume-or-expel-window-right; }

  Super+Comma  { consume-window-into-column; }
  Super+Period { expel-window-from-column; }

  Super+R { switch-preset-column-width; }
  Super+Shift+R { switch-preset-window-height; }
  Super+Ctrl+R { reset-window-height; }
  Super+F { maximize-column; }
  Super+Shift+F { fullscreen-window; }

  Super+Ctrl+F { expand-column-to-available-width; }

  Super+C { center-column; }

  Super+Ctrl+C { center-visible-columns; }

  Super+Minus { set-column-width "-10%"; }
  Super+Equal { set-column-width "+10%"; }

  Super+Shift+Minus { set-window-height "-10%"; }
  Super+Shift+Equal { set-window-height "+10%"; }

  Super+V       { toggle-window-floating; }
  Super+Shift+V { switch-focus-between-floating-and-tiling; }

  Super+W { toggle-column-tabbed-display; }

  Print { screenshot; }
  Ctrl+Print { screenshot-screen; }
  Alt+Print { screenshot-window; }

  Super+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

  Super+Shift+E { quit; }
  Ctrl+Alt+Delete { quit; }

  Super+Shift+P { power-off-monitors; }
}
  '';
}
