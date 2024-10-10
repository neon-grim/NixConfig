{pkgs, lib, ...}:
{
  wayland.windowManager.hyprland.settings =
  {
    exec-once=
    [
      "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
      "${lib.getExe' pkgs.blueman "blueman-applet"}"
      "${lib.getExe' pkgs.networkmanagerapplet "nm-applet"} --indicator"
      "${lib.getExe pkgs.hyprpaper}"
      "${lib.getExe pkgs.swaynotificationcenter}"
      "${lib.getExe pkgs.waybar}"
    ];
  };
}