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
        layout = "master";
        resize_on_border = false;
      };
      master =
      {
        mfact = 0.5;
        new_status = "slave";
        orientation = "center";
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
