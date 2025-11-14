{config, ...}:
{
  wayland.windowManager.hyprland =
  {
    settings =
    {
      xwayland =
      {
        enabled = true;
        use_nearest_neighbor = true;
        force_zero_scaling = true;
      };
      misc =
      {
        render_unfocused_fps = 60;
      };
      render =
      {
        direct_scanout = 1;
        cm_enabled = true;
        cm_fs_passthrough = 2;
        cm_auto_hdr = 1;
      };
      experimental =
      {
        xx_color_management_v4 = true;
      };
    };
  };
}