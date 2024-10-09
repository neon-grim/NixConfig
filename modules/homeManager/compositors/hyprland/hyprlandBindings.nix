{pkgs, lib, ...}:
let
    mainMon = "SUPER";
in
{
  wayland.windowManager.hyprland.settings =
  {
    binds =
    {
      movefocus_cycles_fullscreen = false;
    };
    bindm =
    [
      "${mainMon}, mouse:272, movewindow"
      "${mainMon}, mouse:273, resizewindow"
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
      mainModShift = "${mainMon} SHIFT";
      mainModAlt = "${mainMon} ALT_L";
      mainModControl = "${mainMon} CONTROL_L";
      menu = "pkill wofi; sleep 0.1 && wofi -S drun --width 500 --height 600";
      powerMenu = "pkill wofi; sleep 0.1 && wofiPowerMenu";
    in
    [
      # Execute default programs and actions
      "${mainMon}, Return, exec, ${lib.getExe' pkgs.terminator "terminator"}"
      "${mainMon}, E, exec, ${lib.getExe pkgs.pcmanfm}"
      "${mainMon}, B, exec, ${lib.getExe pkgs.librewolf}"
      "${mainMon}, R, exec, ${menu}"
      "${mainMon}, L, exec, ${powerMenu}"
      "${mainMon}, K, killactive,"
      "${mainMon}, F, fullscreen,"
      "${mainModShift}, L, exit,"
      "${mainModShift}, V, togglefloating,"
      # Change focused window
      "${mainMon}, left, movefocus, l"
      "${mainMon}, right, movefocus, r"
      "${mainMon}, up, movefocus, u"
      "${mainMon}, down, movefocus, d"
      # Move focused window within workspace
      "${mainModShift}, left, movewindow, l"
      "${mainModShift}, right, movewindow, r"
      "${mainModShift}, up, movewindow, u"
      "${mainModShift}, down, movewindow, d"
      # Cycle master window within workspace
      "${mainModControl}, left, layoutmsg, rollnext"
      "${mainModControl}, right, layoutmsg, rollprev"
      # Make focused window Master
      "${mainMon}, home, layoutmsg, swapwithmaster"
      # Navigate between workspaces on the same monitor
      "${mainMon}, PAGE_DOWN, exec, hyprnome -k"
      "${mainMon}, PAGE_UP, exec, hyprnome -p -k -n"
      # Move focused window between workspaces on the same monitor
      "${mainModShift}, PAGE_DOWN, exec, hyprnome -m"
      "${mainModShift}, PAGE_UP, exec, hyprnome -p -m -n"
      # Move focused window between monitors
      "${mainModControl}, PAGE_UP, movewindow, mon:-1"
      "${mainModControl}, PAGE_DOWN, movewindow, mon:+1"
      # Example special workspace (scratchpad)
      "${mainMon}, S, togglespecialworkspace, magic"
      "${mainModShift}, S, movetoworkspace, special:magic"
      "${mainModControl}, S, movetoworkspace, e+0"
      # Scroll through existing workspaces
      "${mainModAlt}, PAGE_UP, workspace, e+1"
      "${mainModAlt}, PAGE_DOWN, workspace, e-1"
      # Screenshot
      "${mainMon}, F9, exec, hyprshot -m region --freeze"
      "${mainMon}, F10, exec, hyprshot -m window -m active --freeze"
      "${mainMon}, F11, exec, hyprshot -m output -m active --freeze"
      # Save clients to file
      "${mainModShift}, F5, exec, hyprctl clients | tee ~/Documents/client.txt"
    ];
  };
}