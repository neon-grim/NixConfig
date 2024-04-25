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
      exec-once=
      [
        "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit"
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.blueman}/bin/blueman-applet"
        "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator"
      ];
    };
  };
}
