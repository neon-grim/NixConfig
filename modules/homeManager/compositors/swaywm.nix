{pkgs, host, lib, config, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/themingConfig.nix)
    backgroundColorOne
    backgroundColorThree
    backgroundColorFour
    backgroundColorFive
    textColorOne
    textColorThree
    textColorFour
    textColorFive
    font
    fontSize;
  inherit (import ../../../hosts/${host}/hostSpecific/systemConfig.nix)
    layout
    variant
    mouseProfile;
  inherit (import ../../../hosts/${host}/hostSpecific/swaywm/monitorConfig.nix)
    monitorSetup
    monitorBinds;
in
{
  wayland.windowManager.sway =
  {
    enable = true;
    checkConfig = false;
    config =
    {
      modifier = "Mod4";
      menu = "'pkill wofi; sleep 0.1 && wofi -S drun'";
      terminal = "${lib.getExe' pkgs.terminator "terminator"}";
      bars = [{command = "${lib.getExe pkgs.waybar}";}];
      output = monitorSetup;
      startup =
      [
        {command = "${lib.getExe' pkgs.pantheon.pantheon-agent-polkit "io.elementary.desktop.agent-polkit"}";}
        {command = "${lib.getExe' pkgs.networkmanagerapplet "nm-applet"} --indicator";}
        {command = "${lib.getExe' pkgs.blueman "blueman-applet"}";}
        {command = "${lib.getExe pkgs.swaynotificationcenter}";}
        {command = "${lib.getExe pkgs.swaysome} init 1";}
      ];
      input =
      {
        "*" =
        {
          xkb_layout = "${layout}";
          xkb_variant = "${variant}";
          xkb_numlock = "enabled";
          accel_profile = "${mouseProfile}";
          pointer_accel = "0";
        };
      };
      fonts = 
      {
        names = [ "${font}" ];
        size = fontSize + 0.0;
      };
      colors =
      {
        focused =
        {
          background = "#${backgroundColorFive}";
          border = "#${backgroundColorFive}";
          childBorder = "#${backgroundColorFive}";
          indicator = "#${backgroundColorFive}";
          text = "#${textColorFive}";
        };
        focusedInactive =
        {
          background = "#${backgroundColorThree}";
          border = "#${backgroundColorThree}";
          childBorder = "#${backgroundColorThree}";
          indicator = "#${backgroundColorThree}";
          text = "#${textColorThree}";
        };
        unfocused =
        {
          background = "#${backgroundColorOne}";
          border = "#${backgroundColorOne}";
          childBorder = "#${backgroundColorOne}";
          indicator = "#${backgroundColorOne}";
          text = "#${textColorOne}";
        };
        urgent =
        {
          background = "#${backgroundColorFour}";
          border = "#${backgroundColorFour}";
          childBorder = "#${backgroundColorFour}";
          indicator = "#${backgroundColorFour}";
          text = "#${textColorFour}";
        };
      };
      keybindings = 
      let 
        mainMod = "${config.wayland.windowManager.sway.config.modifier}";
        mainModShift = "${config.wayland.windowManager.sway.config.modifier}+SHIFT";
        mainModAlt = "${config.wayland.windowManager.sway.config.modifier}+ALT";
        mainModControl = "${config.wayland.windowManager.sway.config.modifier}+CONTROL_L";
        powerMenu = "pkill wofi; sleep 0.1 && ~/.dotfiles/scripts/wofi-power.sh";
      in {
        # Default apps
        "${mainMod}+F" = "exec ${lib.getExe pkgs.librewolf}";
        "${mainMod}+E" = "exec ${lib.getExe pkgs.xfce.thunar}";
        "${mainMod}+L" = "exec '${powerMenu}'";
        "${mainMod}+Return" = "exec ${config.wayland.windowManager.sway.config.terminal}";
        "${mainMod}+R" = "exec ${config.wayland.windowManager.sway.config.menu}";
        # System Operations
        "${mainMod}+K" = "kill";
        "${mainModShift}+C" = "reload";
        "${mainModShift}+L" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
        # Window navigation
        "${mainMod}+A" = "focus parent";
        "${mainMod}+space" = "focus mode_toggle";
        "${mainMod}+left" = "focus left";
        "${mainMod}+right" = "focus right";
        "${mainMod}+up" = "focus up";
        "${mainMod}+down" = "focus down";
        # Move focused window
        "${mainModShift}+left" = "move left";
        "${mainModShift}+right" = "move right";
        "${mainModShift}+up" = "move up";
        "${mainModShift}+down" = "move down";
        # Layout
        "${mainModShift}+R" = "mode 'resize'";
        "${mainModShift}+F" = "fullscreen";
        "${mainModShift}+B" = "splith";
        "${mainModShift}+V" = "splitv";
        "${mainModShift}+T" = "layout stacking";
        "${mainModShift}+W" = "layout tabbed";
        "${mainModShift}+E" = "layout toggle split";
        "${mainModShift}+space" = "floating toggle";
        # Scratchpad
        "${mainMod}+S" = "scratchpad show";
        "${mainModShift}+S" = "move scratchpad";
        # Control volume
        XF86AudioRaiseVolume = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
        XF86AudioLowerVolume = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        XF86AudioMute = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        # Workspace Nagivation
        "${mainMod}+1" = "exec swaysome focus 1";
        "${mainMod}+2" = "exec swaysome focus 2";
        "${mainMod}+3" = "exec swaysome focus 3";
        "${mainMod}+4" = "exec swaysome focus 4";
        "${mainMod}+5" = "exec swaysome focus 5";
        "${mainMod}+6" = "exec swaysome focus 6";
        "${mainMod}+7" = "exec swaysome focus 7";
        "${mainMod}+8" = "exec swaysome focus 8";
        "${mainMod}+9" = "exec swaysome focus 9";
        "${mainMod}+0" = "exec swaysome focus 0";
        # Worspace moce Containers
        "${mainModShift}+1" = "exec swaysome move 1";
        "${mainModShift}+2" = "exec swaysome move 2";
        "${mainModShift}+3" = "exec swaysome move 3";
        "${mainModShift}+4" = "exec swaysome move 4";
        "${mainModShift}+5" = "exec swaysome move 5";
        "${mainModShift}+6" = "exec swaysome move 6";
        "${mainModShift}+7" = "exec swaysome move 7";
        "${mainModShift}+8" = "exec swaysome move 8";
        "${mainModShift}+9" = "exec swaysome move 9";
        "${mainModShift}+0" = "exec swaysome move 0";
        # Focus workspace groups
        "${mainModAlt}+1" = "exec swaysome focus-group 1";
        "${mainModAlt}+2" = "exec swaysome focus-group 2";
        "${mainModAlt}+3" = "exec swaysome focus-group 3";
        "${mainModAlt}+4" = "exec swaysome focus-group 4";
        "${mainModAlt}+5" = "exec swaysome focus-group 5";
        "${mainModAlt}+6" = "exec swaysome focus-group 6";
        "${mainModAlt}+7" = "exec swaysome focus-group 7";
        "${mainModAlt}+8" = "exec swaysome focus-group 8";
        "${mainModAlt}+9" = "exec swaysome focus-group 9";
        "${mainModAlt}+0" = "exec swaysome focus-group 0";
        # Move containers to other workspace groups
        "${mainModControl}+1" = "exec swaysome move-to-group 1";
        "${mainModControl}+2" = "exec swaysome move-to-group 2";
        "${mainModControl}+3" = "exec swaysome move-to-group 3";
        "${mainModControl}+4" = "exec swaysome move-to-group 4";
        "${mainModControl}+5" = "exec swaysome move-to-group 5";
        "${mainModControl}+6" = "exec swaysome move-to-group 6";
        "${mainModControl}+7" = "exec swaysome move-to-group 7";
        "${mainModControl}+8" = "exec swaysome move-to-group 8";
        "${mainModControl}+9" = "exec swaysome move-to-group 9";
        "${mainModControl}+0" = "exec swaysome move-to-group 0";
      };
    };
  };
}
