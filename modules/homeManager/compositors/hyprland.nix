{config, inputs, lib, ...}:
{
  imports =
  [
    inputs.hyprland.homeManagerModules.default
    ./hyprland/hyprlandAutoStart.nix
    ./hyprland/hyprlandBindings.nix
    ./hyprland/hyprlandEnvVars.nix
    ./hyprland/hyprlandInputs.nix
    ./hyprland/hyprlandRender.nix
    ./hyprland/hyprlandStyle.nix
    ./hyprland/hyprlandWindowRules.nix
  ];
  wayland.windowManager.hyprland = lib.mkIf (config.desktop.system.compositors.hyprland.enable)
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
    };
  };
}