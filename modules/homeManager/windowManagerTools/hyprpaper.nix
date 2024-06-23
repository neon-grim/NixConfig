{pkgs, host, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/monitorConfig.nix)
    preloadWallpaper
    wallpaperConfig;
in
{
  services.hyprpaper =
  {
    enable = true;
    settings =
    {
      splash = false;
      preload = preloadWallpaper;
      wallpaper = wallpaperConfig;
    };
  };
}