{pkgs, lib, ...}:
let
    mainMod = "SUPER";
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
      menu = "pkill wofi; sleep 0.1 && wofi -S drun --width 500 --height 600";
      powerMenu = "pkill wofi; sleep 0.1 && wofiPowerMenu";
    in
    [
      # Execute default programs and actions
      "${mainMod}, Return, exec, ${lib.getExe' pkgs.terminator "terminator"}"
      "${mainMod}, E, exec, ${lib.getExe pkgs.pcmanfm}"
      "${mainMod}, B, exec, ${lib.getExe pkgs.librewolf}"
      "${mainMod}, R, exec, ${menu}"
      "${mainMod}, O, exec, ${lib.getExe pkgs.obs-studio}"
      "${mainMod}, L, exec, ${powerMenu}"
      "${mainMod}, K, killactive,"
      "${mainMod}, F, fullscreen,"
      "${mainModShift}, L, exit,"
      "${mainModShift}, V, togglefloating,"
      # OBS shortcuts
      "${mainMod}, F1, pass, ^(com\.obsproject\.Studio)$"
      "${mainMod}, F2, pass, ^(com\.obsproject\.Studio)$"
      # Change focused window
      "${mainMod}, left, movefocus, l"
      "${mainMod}, right, movefocus, r"
      "${mainMod}, up, movefocus, u"
      "${mainMod}, down, movefocus, d"
      # Move focused window within workspace
      "${mainModShift}, left, movewindow, l"
      "${mainModShift}, right, movewindow, r"
      "${mainModShift}, up, movewindow, u"
      "${mainModShift}, down, movewindow, d"
      # Cycle master window within workspace
      "${mainModControl}, left, layoutmsg, rollnext"
      "${mainModControl}, right, layoutmsg, rollprev"
      # Make focused window Master
      "${mainMod}, home, layoutmsg, swapwithmaster"
      # Navigate between workspaces on the same monitor
      "${mainMod}, PAGE_DOWN, exec, hyprnome -k -c"
      "${mainMod}, PAGE_UP, exec, hyprnome -p -k -c"
      # Move focused window between workspaces on the same monitor
      "${mainModShift}, PAGE_DOWN, exec, hyprnome -m -c"
      "${mainModShift}, PAGE_UP, exec, hyprnome -p -m -c"
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
      "${mainMod}, F9, exec, hyprshot -m region --freeze"
      "${mainMod}, F10, exec, hyprshot -m window -m active --freeze"
      "${mainMod}, F11, exec, hyprshot -m output -m active --freeze"
      # Save clients to file
      "${mainModShift}, F5, exec, hyprctl clients | tee ~/Documents/client.txt"
    ];
  };
}