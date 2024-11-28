{config, ...}:
{
  imports =
  [
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
    };
  };
}
