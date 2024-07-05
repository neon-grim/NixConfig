{pkgs, host, lib, ...}:
let
  # Main Mod
  mainMod = "SUPER";
  mainModShift = "SUPER SHIFT";
  mainModAlt = "$SUPER ALT_L";
  mainModControl = "SUPER CONTROL_L";
  # Host specific
  inherit (import ../../../hosts/${host}/hostSpecific/themingConfig.nix)
    backgroundColorOne
    backgroundColorFive;
  inherit (import ../../../hosts/${host}/hostSpecific/systemConfig.nix)
    layout
    mouseProfile
    variant;
  inherit (import ../../../hosts/${host}/hostSpecific/defaultApps.nix)
    browser
    fileManager
    terminal
    menu
    powerMenu;
  inherit (import ../../../hosts/${host}/hostSpecific/monitorConfig.nix)
    monitorSetup
    monitorBinds;
in
{
  wayland.windowManager.hyprland = 
  {
    enable = true;
    settings =
    {
      monitor = monitorSetup ++ [", preferred, auto, 1"];
      exec-once=
      [
        "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
        "${lib.getExe pkgs.waybar}"
        "${lib.getExe pkgs.hyprpaper}"
        "${lib.getExe pkgs.swaynotificationcenter}"
        "blueman-applet"
        "nm-applet --indicator"
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
      misc =
      {
        force_default_wallpaper = 2;
        no_direct_scanout  = true;
      };
      cursor =
      {
        no_hardware_cursors = true;
        no_break_fs_vrr = true;
      };
      master =
      {
        new_status = "slave";
        orientation = "center";
        mfact = 0.5;
      };
      windowrulev2 = 
      [
        "monitor DP-2, class:steam_app*"
        "monitor HDMI-A-2, class:vesktop"
        "center 1, title:(Open File)"
        "center 1, ttitle:(Save As)"
        "center 1, title:(Load Playlist)"
        "size 70% 70%, title:(Open File)"
        "size 70% 70%, title:(Save As)"
        "size 70% 70%, title:(Load Playlist)"
      ];
      binds =
      {
        movefocus_cycles_fullscreen = false;
      };
      bind = monitorBinds ++
      [
        # Execute default programs and actions
        "${mainMod}, Return, exec, ${terminal}"
        "${mainMod}, E, exec, ${fileManager}"
        "${mainMod}, F, exec, ${browser}"
        "${mainMod}, R, exec, ${menu}"
        "${mainMod}, L, exec, ${powerMenu}"
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
        "${mainModControl}, S, movetoworkspace, e+0"
        # Scroll through existing workspaces
        "${mainModAlt}, PAGE_UP, workspace, e+1"
        "${mainModAlt}, PAGE_DOWN, workspace, e-1"
        # Screenshot
        "${mainMod}, F9, exec, hyprshot -m region --freeze"
        "${mainMod}, F10, exec, hyprshot -m window -m active --freeze"
        "${mainMod}, F11, exec, hyprshot -m output -m active --freeze"
      ];
      bindm =
      [
        # Move/resize windows
        "${mainModShift}, mouse:272, movewindow"
        "${mainModShift}, mouse:273, resizewindow"
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
