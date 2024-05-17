{ pkgs, config, ... }:
{
  imports = 
  [
    ./hyprland.nix
    ./hyprpaper.nix
    ./theming.nix
    ./waybar.nix
  ];
}
