{config, ...}:
let
  bkOne = "${config.theming.palette.bkOne}aa";
  bkFive = config.theming.palette.bkFive;
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
      border_size = 3;
      "col.active_border" = "rgb(${bkFive})";
      "col.inactive_border" = "rgba(${bkOne})";
      gaps_in = 5;
      gaps_out = 5;
    };
    decoration =
    {
      drop_shadow = false;
      rounding = 3;
    };
    misc =
    {
      force_default_wallpaper = 2;
    };
  };
}