{pkgs, lib, ...}:
{
  desktop.niri.startup =
  ''
    spawn-at-startup "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
    spawn-at-startup "${lib.getExe' pkgs.blueman "blueman-applet"}"
    spawn-at-startup "${lib.getExe' pkgs.networkmanagerapplet "nm-applet"} --indicator"
    spawn-at-startup "${lib.getExe pkgs.dunst}"
    spawn-at-startup "${lib.getExe pkgs.waybar}"
  '';
}