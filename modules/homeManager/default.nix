{ pkgs, config, ... }:
{
  imports = 
  [
    ./hyprland.nix
    ./theming.nix
    ./waybar.nix
  ];
}
