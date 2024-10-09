{...}:
{
  imports =
  [
    ./waybar/waybarStyle.nix
    ./waybar/waybarModules.nix
  ];
  programs.waybar =
  {
    enable = true;
    settings =
    [
      {
        layer = "top";
        position = "top";
        modules-left =
        [
          "hyprland/workspaces"
          "sway/workspaces"
        ];
        modules-center =
        [ 
          "clock"
        ];
        modules-right =
        [
          "pulseaudio"
          "memory"
          "cpu"
          "custom/notification"
          "tray"
          "custom/powermenu"
        ];
      }
    ];
  };
}
