{...}:
{
  imports =
  [
    ./apps/terminator.nix
    ./generalTheming/theming.nix
    ./windowManagers/hyprland.nix
    ./windowManagerTools/hyprpaper.nix
    ./windowManagerTools/waybar.nix
    ./windowManagerTools/swaync.nix
    ./xdgConfigurations/createUserDirs.nix
    ./xdgConfigurations/defaultApps.nix
  ];
}
