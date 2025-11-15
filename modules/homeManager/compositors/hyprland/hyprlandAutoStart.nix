{pkgs, lib, config, ...}:
{
  wayland.windowManager.hyprland.settings = lib.mkIf (config.desktop.system.compositors.hyprland.enable)
  {
    exec-once=
    [
      "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
      "${lib.getExe' pkgs.blueman "blueman-applet"}"
      "${lib.getExe' pkgs.networkmanagerapplet "nm-applet"} --indicator"
      "${lib.getExe pkgs.dunst}"
      "${lib.getExe pkgs.waybar}"
      "hyprWorkspaceStart"
      "swaybgInit"
    ];
  };
}