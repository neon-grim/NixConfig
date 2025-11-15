{pkgs, lib, config, ...}:
{
  desktop.niri.startup = lib.mkIf (config.desktop.system.compositors.niri.enable)
  ''
    prefer-no-csd
    screenshot-path "~/Pictures/Screenshots/Screenshot_from_%Y-%m-%d %H-%M-%S.png"
    spawn-at-startup "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
    spawn-at-startup "${lib.getExe' pkgs.blueman "blueman-applet"}"
    spawn-at-startup "${lib.getExe' pkgs.networkmanagerapplet "nm-applet"} --indicator"
    spawn-at-startup "${lib.getExe pkgs.dunst}"
    spawn-at-startup "${lib.getExe pkgs.waybar}"
    spawn-sh-at-startup "swaybgInit"
  '';
}