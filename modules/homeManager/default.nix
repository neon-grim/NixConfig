{...}:
{
  imports =
  [
    ./apps/fastFetch.nix
    ./apps/librewolf.nix
    ./apps/kitty.nix
    ./apps/terminator.nix
    ./customOptions/desktopStyleOptions.nix
    ./customOptions/desktopSystemOptions.nix
    ./customOptions/themingOptions.nix
    ./generalTheming/cursor.nix
    ./generalTheming/gtk.nix
    ./generalTheming/qt.nix
    ./system/generalConfig.nix
    ./system/xdgConfig.nix
  ];
}
