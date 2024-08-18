{pkgs, host, lib, inputs, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/themingConfig.nix)
    backgroundColorOne
    backgroundColorFive;
  inherit (import ../../../hosts/${host}/hostSpecific/systemConfig.nix)
    layout
    mouseProfile
    variant;
  inherit (import ../../../hosts/${host}/hostSpecific/hyprland/monitorConfig.nix)
    monitorSetup
    monitorBinds;
  inherit (import ../../../hosts/${host}/hostSpecific/hyprland/hyprlandRules.nix)
    windowRulesV2;
in
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
      monitor = monitorSetup ++ [", preferred, auto, 1"];
      windowrulev2 = windowRulesV2;
      exec-once=
      [
        "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
        "${lib.getExe' pkgs.networkmanagerapplet "nm-applet"} --indicator"
        "${lib.getExe' pkgs.blueman "blueman-applet"}"
        "${lib.getExe pkgs.waybar}"
        "${lib.getExe pkgs.hyprpaper}"
        "${lib.getExe pkgs.swaynotificationcenter}"
      ];
      input =
      {
        kb_layout = "${layout}";
        kb_variant = "${variant}";
        numlock_by_default = true;
        accel_profile = "${mouseProfile}";
        sensitivity = 0;
        follow_mouse = 1;
      };
      general =
      {
        "col.active_border" = "rgb(${backgroundColorFive})";
        "col.inactive_border" = "rgba(${backgroundColorOne}aa)";
        border_size = 3;
        gaps_in = 5;
        gaps_out = 5;
        resize_on_border = true;
        hover_icon_on_border = false;
        allow_tearing = true;
        layout = "master";
      };
      master =
      {
        new_status = "slave";
        orientation = "center";
        mfact = 0.5;
      };
      decoration =
      {
        rounding = 3;
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
      };
      cursor =
      {
        no_hardware_cursors = true;
        no_break_fs_vrr = true;
        min_refresh_rate = 0;
      };
      binds =
      {
        movefocus_cycles_fullscreen = false;
      };
      bind = 
      let 
        mainMod = "SUPER";
        mainModShift = "SUPER SHIFT";
        mainModAlt = "$SUPER ALT_L";
        mainModControl = "SUPER CONTROL_L";
        menu = "pkill wofi; sleep 0.1 && wofi -S drun";
        powerMenu = "pkill wofi; sleep 0.1 && ~/.dotfiles/scripts/wofi-power.sh";
      in
      monitorBinds ++
      [
        # Execute default programs and actions
        "${mainMod}, Return, exec, ${lib.getExe' pkgs.terminator "terminator"}"
        "${mainMod}, E, exec, ${lib.getExe pkgs.xfce.thunar}"
        "${mainMod}, F, exec, ${lib.getExe pkgs.librewolf}"
        "${mainMod}, R, exec, ${menu}"
        "${mainMod}, L, exec, ${powerMenu}"
        "${mainMod}, K, killactive,"
        "${mainModShift}, F, fullscreen,"
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
      let 
        mainMod = "SUPER";
        mainModShift = "SUPER SHIFT";
      in
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
