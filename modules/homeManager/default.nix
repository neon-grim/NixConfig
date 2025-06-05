{compositor, ...}:
{
  imports =
  [
    ./apps/fastFetch.nix
    ./apps/librewolf.nix
    ./apps/kitty.nix
    ./customOptions/desktopStyleOptions.nix
    ./customOptions/desktopSystemOptions.nix
    ./customOptions/themingOptions.nix
    ./generalTheming/cursor.nix
    ./generalTheming/gtk.nix
    ./generalTheming/qt.nix
    ./system/generalConfig.nix
    ./system/xdgConfig.nix
  ] ++ (
    if (compositor == "hyprland") then
    [
      ./compositors/hyprland.nix
      ./compositorTools/hyprlock.nix
      ./compositorTools/hyprpaper.nix
      ./compositorTools/hyprTweaks.nix
      ./compositorTools/hyprWorkspaceStart.nix
      ./compositorTools/dunst.nix
      ./compositorTools/waybar.nix
      ./compositorTools/wofiPowerMenu.nix
    ] else []
  );
}
