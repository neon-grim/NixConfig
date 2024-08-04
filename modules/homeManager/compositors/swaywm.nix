{pkgs, host, lib, config, ...}:
let
  mod = "Mod4";
  # Default Apps
  browser = "librewolf";
  fileManager = "thunar";
  terminal = "terminator";
  # Wofi
  menu = "pkill wofi; sleep 0.1 && wofi -S drun";
  powerMenu = "pkill wofi; sleep 0.1 && ~/.dotfiles/scripts/wofi-power.sh";
  # Host specific
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
      menu = "'${menu}'";
      terminal = "${terminal}";
      modifier = "${mod}";
      bars = [{command = "${lib.getExe pkgs.waybar}";}];
      output = monitorSetup;
      startup =
      [
        {command = "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit";}
        {command = "${lib.getExe pkgs.swaynotificationcenter}";}
        {command = "blueman-applet";}
        {command = "nm-applet --indicator";}
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
      keybindings = let
        term = config.wayland.windowManager.sway.config.terminal;
        dmenu = config.wayland.windowManager.sway.config.menu;
      in {
        # Default apps
        "${mod}+Return" = "exec ${term}";
        "${mod}+F" = "exec ${browser}";
        "${mod}+E" = "exec ${fileManager}";
        "${mod}+R" = "exec ${dmenu}";
        "${mod}+L" = "exec '${powerMenu}'";
        # System Operations
        "${mod}+K" = "kill";
        "${mod}+Shift+C" = "reload";
        "${mod}+Shift+L" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
        # Window navigation
        "${mod}+A" = "focus parent";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+left" = "focus left";
        "${mod}+right" = "focus right";
        "${mod}+up" = "focus up";
        "${mod}+down" = "focus down";
        # Move focused window
        "${mod}+Shift+left" = "move left";
        "${mod}+Shift+right" = "move right";
        "${mod}+Shift+up" = "move up";
        "${mod}+Shift+down" = "move down";
        # Layout
        "${mod}+Shift+R" = "mode 'resize'";
        "${mod}+Shift+F" = "fullscreen";
        "${mod}+Shift+B" = "splith";
        "${mod}+Shift+V" = "splitv";
        "${mod}+Shift+T" = "layout stacking";
        "${mod}+Shift+W" = "layout tabbed";
        "${mod}+Shift+E" = "layout toggle split";
        "${mod}+Shift+space" = "floating toggle";
        # Scratchpad
        "${mod}+S" = "scratchpad show";
        "${mod}+Shift+S" = "move scratchpad";
        # Control volume
        XF86AudioRaiseVolume = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
        XF86AudioLowerVolume = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        XF86AudioMute = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };
    };
    extraConfig =
    ''
      # Change focus between workspaces
      bindsym --no-warn ${mod}+1 exec "swaysome focus 1"
      bindsym --no-warn ${mod}+1 exec "swaysome focus 1"
      bindsym --no-warn ${mod}+2 exec "swaysome focus 2"
      bindsym --no-warn ${mod}+3 exec "swaysome focus 3"
      bindsym --no-warn ${mod}+4 exec "swaysome focus 4"
      bindsym --no-warn ${mod}+5 exec "swaysome focus 5"
      bindsym --no-warn ${mod}+6 exec "swaysome focus 6"
      bindsym --no-warn ${mod}+7 exec "swaysome focus 7"
      bindsym --no-warn ${mod}+8 exec "swaysome focus 8"
      bindsym --no-warn ${mod}+9 exec "swaysome focus 9"
      bindsym --no-warn ${mod}+0 exec "swaysome focus 0"

      # Move containers between workspaces
      bindsym --no-warn ${mod}+Shift+1 exec "swaysome move 1"
      bindsym --no-warn ${mod}+Shift+2 exec "swaysome move 2"
      bindsym --no-warn ${mod}+Shift+3 exec "swaysome move 3"
      bindsym --no-warn ${mod}+Shift+4 exec "swaysome move 4"
      bindsym --no-warn ${mod}+Shift+5 exec "swaysome move 5"
      bindsym --no-warn ${mod}+Shift+6 exec "swaysome move 6"
      bindsym --no-warn ${mod}+Shift+7 exec "swaysome move 7"
      bindsym --no-warn ${mod}+Shift+8 exec "swaysome move 8"
      bindsym --no-warn ${mod}+Shift+9 exec "swaysome move 9"
      bindsym --no-warn ${mod}+Shift+0 exec "swaysome move 0"

      # Focus workspace groups
      bindsym ${mod}+Alt+1 exec "swaysome focus-group 1"
      bindsym ${mod}+Alt+2 exec "swaysome focus-group 2"
      bindsym ${mod}+Alt+3 exec "swaysome focus-group 3"
      bindsym ${mod}+Alt+4 exec "swaysome focus-group 4"
      bindsym ${mod}+Alt+5 exec "swaysome focus-group 5"
      bindsym ${mod}+Alt+6 exec "swaysome focus-group 6"
      bindsym ${mod}+Alt+7 exec "swaysome focus-group 7"
      bindsym ${mod}+Alt+8 exec "swaysome focus-group 8"
      bindsym ${mod}+Alt+9 exec "swaysome focus-group 9"
      bindsym ${mod}+Alt+0 exec "swaysome focus-group 0"

      # Move containers to other workspace groups
      bindsym ${mod}+Alt+Shift+1 exec "swaysome move-to-group 1"
      bindsym ${mod}+Alt+Shift+2 exec "swaysome move-to-group 2"
      bindsym ${mod}+Alt+Shift+3 exec "swaysome move-to-group 3"
      bindsym ${mod}+Alt+Shift+4 exec "swaysome move-to-group 4"
      bindsym ${mod}+Alt+Shift+5 exec "swaysome move-to-group 5"
      bindsym ${mod}+Alt+Shift+6 exec "swaysome move-to-group 6"
      bindsym ${mod}+Alt+Shift+7 exec "swaysome move-to-group 7"
      bindsym ${mod}+Alt+Shift+8 exec "swaysome move-to-group 8"
      bindsym ${mod}+Alt+Shift+9 exec "swaysome move-to-group 9"
      bindsym ${mod}+Alt+Shift+0 exec "swaysome move-to-group 0"

      # Move focused container to next output
      bindsym ${mod}+o exec "swaysome next-output"
      # Move focused container to previous output
      bindsym ${mod}+Shift+o exec "swaysome prev-output"

      # Move focused workspace group to next output
      bindsym ${mod}+Alt+o exec "swaysome workspace-group-next-output"
      # Move focused workspace group to previous output
      bindsym ${mod}+Alt+Shift+o exec "swaysome workspace-group-prev-output"

      # Init workspaces for every screen
      exec "swaysome init 1"
    '';
  };
}
