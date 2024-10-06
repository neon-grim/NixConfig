{pkgs, lib, inputs, config, ...}:
{
  imports =
  [
    inputs.hyprland.homeManagerModules.default
  ];
  wayland.windowManager.hyprland =
  {
    enable = true;
    settings =
    {
      monitor = [", preferred, auto, 1"];
      xwayland.enabled = true;
      env =
      [
        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland,x11,*"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "XCURSOR_SIZE,${toString config.desktop.cursorSize}"
        "HYPRSHOT_DIR,$XDG_PICTURES_DIR/sc"
      ];
      exec-once=
      [
        "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
        "${lib.getExe' pkgs.blueman "blueman-applet"}"
        "${lib.getExe' pkgs.networkmanagerapplet "nm-applet"} --indicator"
        "${lib.getExe pkgs.hyprpaper}"
        "${lib.getExe pkgs.swaynotificationcenter}"
        "${lib.getExe pkgs.waybar}"
      ];
      general =
      {
        border_size = 3;
        "col.active_border" = "rgb(${config.theming.palette.bkFive})";
        "col.inactive_border" = "rgba(${config.theming.palette.bkOne}aa)";
        gaps_in = 5;
        gaps_out = 5;
        hover_icon_on_border = false;
        layout = "master";
        resize_on_border = false;
      };
      master =
      {
        mfact = 0.5;
        new_status = "slave";
        orientation = "center";
      };
      input =
      {
        accel_profile = "flat";
        follow_mouse = 1;
        kb_layout = config.desktop.kbLayout;
        kb_variant = config.desktop.kbVariant;
        numlock_by_default = true;
        sensitivity = 0;
      };
      animations = 
      {
        enabled = true;
        animation =
        [
          "windows, 1, 5, default"
          "windowsIn, 1, 5, default"
          "windowsOut, 1, 5, default"
          "border, 1, 3, default"
          "borderangle, 1, 3, default"
          "fade, 1, 5, default"
          "workspaces, 1, 3, default"
        ];
      };
      decoration =
      {
        drop_shadow = false;
        rounding = 3;
      };
      misc =
      {
        force_default_wallpaper = 2;
      };
      binds =
      {
        movefocus_cycles_fullscreen = false;
      };
      bindm =
      [
        "${config.desktop.mainMod}, mouse:272, movewindow"
        "${config.desktop.mainMod}, mouse:273, resizewindow"
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
        mainModShift = "${config.desktop.mainMod} SHIFT";
        mainModAlt = "${config.desktop.mainMod} ALT_L";
        mainModControl = "${config.desktop.mainMod} CONTROL_L";
        menu = "pkill wofi; sleep 0.1 && wofi -S drun";
        powerMenu = "pkill wofi; sleep 0.1 && wofiPowerMenu";
      in
      [
        # Execute default programs and actions
        "${config.desktop.mainMod}, Return, exec, ${lib.getExe' pkgs.terminator "terminator"}"
        "${config.desktop.mainMod}, E, exec, ${lib.getExe pkgs.pcmanfm}"
        "${config.desktop.mainMod}, B, exec, ${lib.getExe pkgs.librewolf}"
        "${config.desktop.mainMod}, R, exec, ${menu}"
        "${config.desktop.mainMod}, L, exec, ${powerMenu}"
        "${config.desktop.mainMod}, K, killactive,"
        "${config.desktop.mainMod}, F, fullscreen,"
        "${mainModShift}, L, exit,"
        "${mainModShift}, V, togglefloating,"
        # Change focused window
        "${config.desktop.mainMod}, left, movefocus, l"
        "${config.desktop.mainMod}, right, movefocus, r"
        "${config.desktop.mainMod}, up, movefocus, u"
        "${config.desktop.mainMod}, down, movefocus, d"
        # Move focused window within workspace
        "${mainModShift}, left, movewindow, l"
        "${mainModShift}, right, movewindow, r"
        "${mainModShift}, up, movewindow, u"
        "${mainModShift}, down, movewindow, d"
        # Cycle master window within workspace
        "${mainModControl}, left, layoutmsg, rollnext"
        "${mainModControl}, right, layoutmsg, rollprev"
        # Make focused window Master
        "${config.desktop.mainMod}, home, layoutmsg, swapwithmaster"
        # Navigate between workspaces on the same monitor
        "${config.desktop.mainMod}, PAGE_DOWN, exec, hyprnome -k"
        "${config.desktop.mainMod}, PAGE_UP, exec, hyprnome -p -k -n"
        # Move focused window between workspaces on the same monitor
        "${mainModShift}, PAGE_DOWN, exec, hyprnome -m"
        "${mainModShift}, PAGE_UP, exec, hyprnome -p -m -n"
        # Move focused window between monitors
        "${mainModControl}, PAGE_UP, movewindow, mon:-1"
        "${mainModControl}, PAGE_DOWN, movewindow, mon:+1"
        # Example special workspace (scratchpad)
        "${config.desktop.mainMod}, S, togglespecialworkspace, magic"
        "${mainModShift}, S, movetoworkspace, special:magic"
        "${mainModControl}, S, movetoworkspace, e+0"
        # Scroll through existing workspaces
        "${mainModAlt}, PAGE_UP, workspace, e+1"
        "${mainModAlt}, PAGE_DOWN, workspace, e-1"
        # Screenshot
        "${config.desktop.mainMod}, F9, exec, hyprshot -m region --freeze"
        "${config.desktop.mainMod}, F10, exec, hyprshot -m window -m active --freeze"
        "${config.desktop.mainMod}, F11, exec, hyprshot -m output -m active --freeze"
        # Save clients to file
        "${mainModShift}, F5, exec, hyprctl clients | tee ~/Documents/client.txt"
      ];
    };
  };
}
