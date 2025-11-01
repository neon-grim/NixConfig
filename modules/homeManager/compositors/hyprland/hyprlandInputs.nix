{config, ...}:
let
  kbLayout = config.desktop.system.kb.layout;
  kbVariant = config.desktop.system.kb.variant;
in
{
  wayland.windowManager.hyprland =
  {
    settings =
    {
      input =
      {
        accel_profile = "flat";
        follow_mouse = 1;
        kb_layout = kbLayout;
        kb_variant = kbVariant;
        numlock_by_default = true;
        sensitivity = 0;
      };
      cursor =
      {
        min_refresh_rate = 0;
        no_break_fs_vrr = 1;
      };
    };
  };
}
