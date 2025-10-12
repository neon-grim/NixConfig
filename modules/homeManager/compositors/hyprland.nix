{config, inputs, ...}:
{
  imports =
  [
    inputs.hyprland.homeManagerModules.default
    ./hyprland/hyprlandAutoStart.nix
    ./hyprland/hyprlandBindings.nix
    ./hyprland/hyprlandEnvVars.nix
    ./hyprland/hyprlandStyle.nix
  ];
  wayland.windowManager.hyprland =
  {
    enable = true;
    settings =
    {
      general =
      {
        hover_icon_on_border = false;
        layout = "dwindle";
        resize_on_border = false;
        snap =
        {
          enabled = true;
          border_overlap = true;
          monitor_gap = 15;
          window_gap = 15;
        };
      };
      dwindle =
      {
        pseudotile = true;
        force_split = 2;
      };
      input =
      {
        accel_profile = "flat";
        follow_mouse = 1;
        kb_layout = config.desktop.system.kb.layout;
        kb_variant = config.desktop.system.kb.variant;
        numlock_by_default = true;
        sensitivity = 0;
      };
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
      cursor =
      {
        min_refresh_rate = 0;
        no_break_fs_vrr = 1;
      };
    };
  };
}
