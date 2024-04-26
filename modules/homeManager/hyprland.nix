{pkgs, lib, config, inputs, ... }:
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
    # executes programs at start of session
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
      
    # set gap settings
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
    };
  };
}
