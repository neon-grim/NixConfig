{pkgs, host, ...}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    wallpaperOne
    wallpaperTwo
    wallpaperThree;
in
{
  services.hyprpaper =
  {
    enable = true;
    settings =
    {
      splash = false;
      preload =
      [
        "${wallpaperOne}"
        "${wallpaperTwo}"
        "${wallpaperThree}"
      ];
      wallpaper =
      [
        "DP-2,${wallpaperOne}"
        "HDMI-A-1,${wallpaperTwo}"
        "HDMI-A-2,${wallpaperThree}"
      ];
    };
  };
}