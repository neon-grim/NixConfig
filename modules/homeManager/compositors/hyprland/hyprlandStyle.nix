{config, ...}:
let
  accentDefault = config.theming.palette.accentDefault;
  accentDark = "${config.theming.palette.accentDark}aa";
in
{
  wayland.windowManager.hyprland.settings =
  {
    animations = 
    {
      enabled = true;
      animation =
      [
        "windows, 1, 5, default"
        "windowsIn, 1, 5, default"
        "windowsOut, 1, 5, default"
        "border, 1, 3, default"
        "borderangle, 1, 3, default"
        "fade, 1, 5, default"
        "workspaces, 1, 3, default"
      ];
    };
    general =
    {
      border_size = 2;
      "col.active_border" = "rgb(${accentDefault})";
      "col.inactive_border" = "rgba(${accentDark})";
      gaps_in = 0;
      gaps_out = 0;
    };
    decoration =
    {
      shadow.enabled = false;
      rounding = 0;
    };
    misc =
    {
      force_default_wallpaper = 2;
    };
  };
}