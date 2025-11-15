{pkgs, lib, config, ...}:
let
    mainMod = "SUPER";
in
{
  wayland.windowManager.hyprland.settings = lib.mkIf (config.desktop.system.compositors.hyprland.enable)
  {
    binds =
    {
      movefocus_cycles_fullscreen = false;
    };
    bindm =
    [
      "${mainMod}, mouse:272, movewindow"
      "${mainMod}, mouse:273, resizewindow"
    ];
    bindl =
    [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioRewind, exec, playerctl position 5-"
      ", XF86AudioForward, exec, playerctl position 5+"
    ];
    bind =
    let 
      mainModShift = "${mainMod} SHIFT";
      mainModAlt = "${mainMod} ALT_L";
      mainModControl = "${mainMod} CONTROL_L";
      menu = "pkill wofi; sleep 0.1 && wofi -S drun -I --width 500 --height 600";
      powerMenu = "pkill wofi; sleep 0.1 && wofiPowerMenu";
    in
    [
      # Execute default programs and actions
      "${mainMod}, RETURN, exec, ${lib.getExe pkgs.kitty}"
      "${mainMod}, E, exec, ${lib.getExe' pkgs.nemo-with-extensions "nemo"}"
      "${mainMod}, R, exec, ${menu}"
      "${mainMod}, L, exec, ${powerMenu}"
      # Change focused window
      "${mainMod}, LEFT, movefocus, l"
      "${mainMod}, RIGHT, movefocus, r"
      "${mainMod}, UP, movefocus, u"
      "${mainMod}, DOWN, movefocus, d"
      # Move focused window within workspace
      "${mainModShift}, LEFT, movewindow, l"
      "${mainModShift}, RIGHT, movewindow, r"
      "${mainModShift}, UP, movewindow, u"
      "${mainModShift}, DOWN, movewindow, d"
      # Layout shortcut
      "${mainMod}, TAB, layoutmsg, swapsplit"
      "${mainMod}, HOME, layoutmsg, movetoroot active unstable"
      "${mainMod}, P, pseudo,"
      # System
      "${mainMod}, END, killactive,"
      "${mainMod}, F, fullscreen,"
      "${mainModShift}, L, exit,"
      "${mainModShift}, V, togglefloating,"
      # Navigate between workspaces on the same monitor
      "${mainMod}, PAGE_DOWN, exec, hyprnome -k -c"
      "${mainMod}, PAGE_UP, exec, hyprnome -p -k -c"
      "${mainMod}, G, workspace, 1"
      # Move focused window between workspaces on the same monitor
      "${mainModShift}, PAGE_DOWN, exec, hyprnome -m -c"
      "${mainModShift}, PAGE_UP, exec, hyprnome -p -m -c"
      "${mainModShift}, G, movetoworkspace, 1"
      # Move focused window between monitors
      "${mainModControl}, PAGE_UP, movewindow, mon:-1"
      "${mainModControl}, PAGE_DOWN, movewindow, mon:+1"
      # Example special workspace (scratchpad)
      "${mainMod}, S, togglespecialworkspace, magic"
      "${mainModShift}, S, movetoworkspace, special:magic"
      "${mainModControl}, S, movetoworkspace, e+0"
      # Scroll through existing workspaces
      "${mainModAlt}, PAGE_UP, workspace, e+1"
      "${mainModAlt}, PAGE_DOWN, workspace, e-1"
      # Screenshot
      "${mainMod}, PRINT, exec, hyprshot -m window -m active --freeze"
      "${mainModShift}, PRINT, exec, hyprshot -m output -m active --freeze"
      "${mainModControl}, PRINT, exec, hyprshot -m region --freeze"
    ];
  };
}