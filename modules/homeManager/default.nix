{...}:
{
  imports =
  [
    ./apps/librewolf.nix
    ./apps/terminator.nix
    ./customOptions/desktopOptions.nix
    ./customOptions/themingOptions.nix
    ./generalTheming/cursor.nix
    ./generalTheming/gtk.nix
    ./generalTheming/qt.nix
    ./system/defaultApps.nix
    ./system/generalConfig.nix
  ];
}
