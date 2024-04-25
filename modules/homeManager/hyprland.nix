{pkgs, lib, config, ... }
{
  wayland.windowManager.hyprland = 
  {
    plugins = with inputs.hyprland-plugins.packages."${pkgs.sysstem}";
    [
      borders-plus-plus
      hyprbar
      hyprexpo
    ];
    extraConfig = ''${builtins.readFile ./../../hyprlandConfig/hyprland.conf}'';
  }
}
