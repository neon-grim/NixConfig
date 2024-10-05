{host, ...}:
{
  imports =
  [
    ./apps/defaultApps.nix
    ./compositors/hyprland.nix
    ./compositorTools/waybar.nix
    ./compositorTools/swaync.nix
    ./compositorTools/hyprpaper.nix
    ./compositorTools/hyprlandTweaks.nix
    ../../hosts/${host}/hostSpecific/hyprland/monitorConfig.nix
    ../../hosts/${host}/hostSpecific/hyprland/hyprlandRules.nix
  ];
}
