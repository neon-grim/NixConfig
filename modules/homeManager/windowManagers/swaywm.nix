{pkgs, host, lib, config, ...}:
let
  # Todo: Figure out what splitting is
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
  inherit (import ../../../hosts/${host}/hostSpecific/defaultApps.nix)
    browser
    fileManager
    terminal
    menu
    powerMenu;
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
      modifier = "Mod4";
      bars = [{ command = "${lib.getExe pkgs.waybar}"; }];
      startup =
      [
        {command = "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit";}
        {command = "${lib.getExe pkgs.swaynotificationcenter}";}
        {command = "blueman-applet";}
        {command = "nm-applet --indicator";}
      ];
      output =
      {
        "Samsung Electric Company Odyssey G95SC H1AK500000" =
        {
          mode = "5120x1440@120.000Hz";
          adaptive_sync = "on";
          pos = "0 0";
          bg = "~/Pictures/bg/Death_Superwide.png fill";
        };
        "DO NOT USE - RTK Verbatim MT14 demoset-1" =
        {
          pos = "1280 1440";
          bg = "~/Pictures/bg/red_transistor.png fill";
        };
        "HDMI-A-2" =
        {
          bg = "~/Pictures/bg/instrument.png fill";
          pos = "5120 0";
          transform = "90";
        };
      };
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
        mod = config.wayland.windowManager.sway.config.modifier;
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
        # Workspace navigation
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        # Move focused window
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
        # Control volume
        XF86AudioRaiseVolume = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
        XF86AudioLowerVolume = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        XF86AudioMute = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };
    };
  };
}
