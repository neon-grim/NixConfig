{pkgs, config, ...}:
{
  imports =
  [
    ./hostSpecific/homeManager/monitorConfig.nix
    ./hostSpecific/homeManager/hyprlandRules.nix
  ];
  desktop =
  {
    style =
    {
      cursorSize = 24;
      font =
      {
        name = "JetBrainsMono Nerd Font";
        size = 14;
        package = pkgs.nerd-fonts.jetbrains-mono;
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
