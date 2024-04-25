{pkgs, lib, config, inputs, ... }:
{
  wayland.windowManager.hyprland = 
  {
    enable = true;
    plugins = with inputs.hyprland-plugins.packages."${pkgs.system}";
    [
      #borders-plus-plus
      hyprexpo
    ];
    extraConfig = ''${builtins.readFile ./../../hyprlandConfig/hyprland.conf}'';
  };
}
