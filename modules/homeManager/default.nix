{themeConfig, ...}:
{
  imports =
  [
    ./apps/librewolf.nix
    ./apps/terminator.nix
    ./generalTheming/theming.nix
    ./generalTheming/${themeConfig}.nix
    ./customOptions/desktopOptions.nix
    ./customOptions/themingOptions.nix
  ];
}
