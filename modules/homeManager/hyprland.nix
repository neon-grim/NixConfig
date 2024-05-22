{pkgs, ...}:
let
  mainMod = "SUPER";
  secondMod = "ALT_L";
  terminal = "terminator";
  fileManager = "thunar";
  menu = "rofi -show drun -show-icons";
  browser = "firefox";
  powerMenu = "nwg-bar";
in
{
  wayland.windowManager.hyprland = 
  {
    enable = true;
    settings =
    {
      # auto start
      exec-once=
      [
        "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.blueman}/bin/blueman-applet"
        "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator"
        "${pkgs.swaynotificationcenter}/bin/swaync"
        "${pkgs.hyprpaper}/bin/hyprpaper"
      ];
      # screen setup
      monitor =
      [
        ",preferred,auto,1"
        "HDMI-A-2,2560x1440@75,0x0,1,transform,3"
        "DP-2,5120x1440@240.00,1440x640,1,bitdepth,10"
        "HDMI-A-1,1920x1080@60,2720x2080,1"
      ];
      # HID settings
      input =
      {
        kb_layout = "ch";
        kb_variant = "de_nodeadkeys";
        numlock_by_default = true;
        sensitivity = 0;
        follow_mouse = 2;
        accel_profile = "flat";
      };
      # customization
      general =
      {
        border_size = 3;
        gaps_in = 5;
        gaps_out = 5;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
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
        #no_direct_scanout = false;
        force_default_wallpaper = 2;
      };
      # tiling layout
      dwindle =
      {
        
      };
      master =
      {
        new_is_master = false;
        orientation = "center";
        mfact = 0.5;
      };
      windowrulev2 = 
      [
        "suppressevent maximize, class:.*"
      ];
      bind =
      [
        # Execute default programs and actions
        "${mainMod}, Q, exec, ${terminal}"
        "${mainMod}, E, exec, ${fileManager}"
        "${mainMod}, F, exec, ${browser}"
        "${mainMod}, R, exec, ${menu}"
        "${mainMod}, L, exec, ${powerMenu}"
        "${mainMod}, V, togglefloating,"
        "${mainMod}, K, killactive,"
        "${mainMod} SHIFT, L, exit,"
        # Change focused window
        "${mainMod}, left, movefocus, l"
        "${mainMod}, right, movefocus, r"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"
        # Cycle master window within workspace
        "${mainMod} SHIFT, left, layoutmsg, rollnext"
        "${mainMod} SHIFT, right, layoutmsg, rollprev"
        "${mainMod}, home, layoutmsg, swapwithmaster"
        #Swap focused window within workspace
        "${mainMod} CONTROL, left, layoutmsg, swapprev"
        "${mainMod} CONTROL, right, layoutmsg, swapnext"
        # Cycle focus between Monitors
        "${mainMod} SHIFT, up, focusmonitor, -1"
        "${mainMod} SHIFT, down, focusmonitor, +1"
        # Swap focused window between monitors
        "${mainMod} CONTROL, up, movewindow, mon:-1"
        "${mainMod} CONTROL, down, movewindow, mon:+1"
        # Navigate between workspaces on the same monitor
        "${mainMod}, PAGE_DOWN, exec, hyprnome"
        "${mainMod}, PAGE_UP, exec, hyprnome --previous"
        # Move active window between workspaces on the same monitor
        "${mainMod} SHIFT, PAGE_DOWN, exec, hyprnome --move"
        "${mainMod} SHIFT, PAGE_UP, exec, hyprnome --previous --move"
        # Example special workspace (scratchpad)
        "${mainMod}, S, togglespecialworkspace, magic"
        "${mainMod} SHIFT, S, movetoworkspace, special:magic"
        # Scroll through existing workspaces
        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"
        # No VRR Desktop
        "${mainMod} SHIFT, F1, exec, hyprctl keyword monitor DP-2,5120x1440@240.00,1440x640,1,bitdepth,10"
        "${mainMod} SHIFT, F2, exec, hyprctl keyword monitor DP-2,5120x1440@120.00,1440x640,1,bitdepth,10"
        # VRR Gaming
        "${mainMod} SHIFT, F3, exec, hyprctl keyword monitor DP-2,5120x1440@240.00,1440x640,1,vrr,2,bitdepth,10"
        "${mainMod} SHIFT, F4, exec, hyprctl keyword monitor DP-2,5120x1440@120.00,1440x640,1,vrr,2,bitdepth,10"
        "${mainMod} SHIFT, F5, exec, hyprctl keyword monitor DP-2,5120x1440@60.00,1440x640,1,vrr,2,bitdepth,10"
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
