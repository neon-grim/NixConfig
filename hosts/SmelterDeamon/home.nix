{config, lib, pkgs, user, compositor, ...}:
{
  imports =
  [
    ./../../modules/homeManager/default.nix
    ./../../modules/homeManager/${compositor}.nix
  ] ++
  (
    if (compositor == "hyprland") then
    [
      ./../../modules/homeManager/hyprland.nix
      ./hostSpecific/hyprland/monitorConfig.nix
      ./hostSpecific/hyprland/hyprlandRules.nix
    ]
    else []
  );
  
  desktop =
  {
    style =
    {
      cursorSize = 24;
      font =
      {
        name = "JetBrainsMono Nerd Font";
        size = 14;
      };
      themePreset = "andromeda";
    };
    system =
    {
      hyprlock = true;
      kb =
      {
        layout = "ch";
        variant = "de_nodeadkeys";
      };
    };
  };
}
