{pkgs, host, lib, inputs, ...}:
let
  mainMod = "SUPER";
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
    windowRules;
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
      # Monitor Settings
      monitor = monitorSetup ++ [", preferred, auto, 1"];
      windowrulev2 = windowRules;
      # General Settings
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
        allow_tearing = true;
        border_size = 3;
        "col.active_border" = "rgb(${backgroundColorFive})";
        "col.inactive_border" = "rgba(${backgroundColorOne}aa)";
        gaps_in = 5;
        gaps_out = 5;
        hover_icon_on_border = false;
        layout = "master";
        resize_on_border = true;
      };
      master =
      {
        mfact = 0.5;
        new_status = "slave";
        orientation = "center";
      };
      # Input Settings
      input =
      {
        accel_profile = "${mouseProfile}";
        follow_mouse = 1;
        kb_layout = "${layout}";
        kb_variant = "${variant}";
        numlock_by_default = true;
        sensitivity = 0;
      };
      cursor =
      {
        min_refresh_rate = 0;
        no_hardware_cursors = true;
        no_break_fs_vrr = true;
      };
      # Theming
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
      # WM Bindings
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
      ];
      bind = 
      let 
        mainModShift = "${mainMod} SHIFT";
        mainModAlt = "${mainMod} ALT_L";
        mainModControl = "${mainMod} CONTROL_L";
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
    };
  };
}
