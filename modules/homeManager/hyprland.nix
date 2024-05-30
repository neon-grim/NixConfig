{pkgs, host, ...}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    # ModKeys
    mainMod
    mainmodAlt
    mainModControl
    mainModShift
    # Default Apps
    browser
    fileManager
    menu
    powerMenu
    taskManager
    terminal
    # Border Color
    backgroundColorOne
    backgroundColorFive
    # Keyboard
    layout
    mouseProfile
    variant;
in
{
  wayland.windowManager.hyprland = 
  {
    enable = true;
    settings =
    {
      exec-once=
      [
        "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
        "dbus-update-activation-environment --systemd --all"
        "blueman-applet"
        "nm-applet --indicator"
        "killall -q hyprpaper;sleep .5 && hyprpaper"
        "killall -q swaync;sleep .5 && swaync"
        "killall -q waybar;sleep .5 && waybar"
      ];
      monitor =
      [
        ",preferred,auto,1"
        "HDMI-A-2,2560x1440@75,0x0,1,transform,3"
        "DP-2,5120x1440@240.00,1440x640,1,bitdepth,10"
        "HDMI-A-1,1920x1080@60,2720x2080,1"
      ];
      input =
      {
        kb_layout = "${layout}";
        kb_variant = "${variant}";
        numlock_by_default = true;
        sensitivity = 0;
        follow_mouse = 1;
        accel_profile = "${mouseProfile}";
      };
      general =
      {
        border_size = 3;
        gaps_in = 5;
        gaps_out = 5;
        "col.active_border" = "rgb(${backgroundColorFive})";
        "col.inactive_border" = "rgba(${backgroundColorOne}aa)";
        resize_on_border = true;
        hover_icon_on_border = false;
        layout = "master";
        allow_tearing = false;
      };
      decoration =
      {
        rounding = 3;
        active_opacity = 1;
        inactive_opacity = 1;
        fullscreen_opacity = 1;
        drop_shadow = false;
      };
      animations = 
      {
        enabled = true;
        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
        animation =
        [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      misc =
      {
        force_default_wallpaper = 2;
      };
      master =
      {
        new_is_master = false;
        orientation = "center";
        mfact = 0.5;
      };
      windowrulev2 = 
      [
        "monitor DP-2, class:steam_app*"
        "monitor HDMI-A-2, class:vesktop"
        "fullscreen, class:steam_app*"
        "center 1, title:(Open File)"
        "size 70% 70%, title:(Open File)"
        "center 1, title:(Save As)"
        "size 70% 70%, title:(Save As)"
      ];
      bind =
      [
        # Execute default programs and actions
        "${mainMod}, Q, exec, ${terminal}"
        "${mainMod}, E, exec, ${fileManager}"
        "${mainMod}, F, exec, ${browser}"
        "${mainMod}, R, exec, ${menu}"
        "${mainMod}, L, exec, ${powerMenu}"
        "${mainMod}, T, exec, ${taskManager}"
        "${mainMod}, K, killactive,"
        "${mainModShift}, L, exit,"
        "${mainModShift}, V, togglefloating,"
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
        "${mainMod}, PAGE_DOWN, exec, hyprnome -k"
        "${mainMod}, PAGE_UP, exec, hyprnome --previous -k"
        # Move focused window between workspaces on the same monitor
        "${mainModShift}, PAGE_DOWN, exec, hyprnome --move"
        "${mainModShift}, PAGE_UP, exec, hyprnome --previous --move"
        # Move focused window between monitors
        "${mainModControl}, PAGE_UP, movewindow, mon:-1"
        "${mainModControl}, PAGE_DOWN, movewindow, mon:+1"
        # Example special workspace (scratchpad)
        "${mainMod}, S, togglespecialworkspace, magic"
        "${mainModShift}, S, movetoworkspace, special:magic"
        # Scroll through existing workspaces
        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"
        # No VRR Desktop
        "${mainModShift} SHIFT, F1, exec, hyprctl keyword monitor DP-2,5120x1440@240.00,1440x640,1,bitdepth,10"
        "${mainModShift} SHIFT, F2, exec, hyprctl keyword monitor DP-2,5120x1440@120.00,1440x640,1,bitdepth,10"
        # VRR Gaming
        "${mainModShift}, F3, exec, hyprctl keyword monitor DP-2,5120x1440@240.00,1440x640,1,vrr,2,bitdepth,10"
        "${mainModShift}, F4, exec, hyprctl keyword monitor DP-2,5120x1440@120.00,1440x640,1,vrr,2,bitdepth,10"
        "${mainModShift}, F5, exec, hyprctl keyword monitor DP-2,5120x1440@60.00,1440x640,1,vrr,2,bitdepth,10"
        # Screenshot
        "${mainMod}, F9, exec, hyprshot -m window -c"
        "${mainMod}, F10, exec, hyprshot -m region"
        "${mainMod}, F11, exec, hyprshot -m output -c"
      ];
      bindm =
      [
        # Move/resize windows
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];
      bindl =
      [
        # volume control
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
    };
  };
}
