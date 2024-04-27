{ pkgs, config, ... }:
{
  imports = 
  [
    ./hyprland.nix
    ./theming.nix
  #  ./steamTheme.nix
  #  ./terminator.nix
    ./waybar.nix
  ];
}
