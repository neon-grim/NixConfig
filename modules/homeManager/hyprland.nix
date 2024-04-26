{pkgs, lib, config, inputs, ... }:
let
  mainMod = "SUPER";
  secondMod = "ALT_L";
  terminal = "terminator";
  fileManager = "nemo";
  menu = "rofi -show drun -show-icons";
  browser = "firefox";
in
{
  wayland.windowManager.hyprland = 
  {
    enable = true;
    
    plugins = with inputs.hyprland-plugins.packages."${pkgs.system}";
    [
      #borders-plus-plus
      #hyprexpo
    ];
    
    extraConfig = ''${builtins.readFile ./../../hyprlandConfig/hyprland.conf}'';
    
    settings = 
    {
      exec-once=
      [
        "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.blueman}/bin/blueman-applet"
        "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator"
      ];
      
      monitor = 
      [
        ",preferred,auto,1"
        "DP-2,5120x1440@240,0x0,1,vrr,2"
        "HDMI-A-1,1920x1080@60,1280x1440,1"
        "HDMI-A-2,2560x1440@75,-1440x-640,1,transform,3"
      ];
      
      input = 
      {
        kb_layout = "ch";
        kb_variant = "de_nodeadkeys";
        numlock_by_default = true;
        sensitivity = 0;
        follow_mouse = 1;
        accel_profile = "flat";
      };
      
      general = 
      {
        border_size = 2;
        gaps_in = 3;
        gaps_out = 3;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        hover_icon_on_border = false;
        layout = "master";
        allow_tearing = false;
      };
      
      decoration = 
      {
        rounding = 2;
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
      
      master =
      {
        new_is_master = true;
      };
      
      misc = 
      {
        force_default_wallpaper = 2;
      };
      
      windowrulev2 = 
      [
        "suppressevent maximize, class:.*"
      ];
      
      bind =
      [
        # execute default programs and actions
        "${mainMod}, Q, exec, ${terminal}"
        "${mainMod}, E, exec, ${fileManager}"
        "${mainMod}, F, exec, ${browser}"
        "${mainMod}, R, exec, ${menu}"
        "${secondMod}, F4, killactive,"
        "${mainMod}, L, exit,"
        "${mainMod}, V, togglefloating,"
        "${mainMod}, P, pseudo,"
        "${mainMod}, J, togglesplit,"
        
        # change window focus 
        "${mainMod}, left, movefocus, l"
        "${mainMod}, right, movefocus, r"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"
        
        # switch workspaces
        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 0, workspace, 0"
        
        # hypernome navegation
        "${mainMod}, PAGE_DOWN, exec, hyprnome"
        "${mainMod}, PAGE_UP, exec, hyprnome --previous"
        "${mainMod} SHIFT, PAGE_DOWN, exec, hyprnome --move"
        "${mainMod} SHIFT, PAGE_UP, exec, hyprnome --previous --move"
        
        # Move active window to workspace
        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 0"
        
        # Example special workspace (scratchpad)
        "${mainMod}, S, togglespecialworkspace, magic"
        "${mainMod} SHIFT, S, movetoworkspace, special:magic"
        
        # Scroll through existing workspaces
        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"
      ];
      
      bindm = 
      [      
        # Move/resize windows
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];
    };
  };
}
