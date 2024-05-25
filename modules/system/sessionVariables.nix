{host, ...}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    cursorSize
    cursorTheme;
in
{
  environment.sessionVariables = 
  {
    NIXOS_OZONE_WL = "1";
    XCURSOR_SIZE = cursorSize;
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland,x11";
    CLUTTER_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    SDL_VIDEODRIVER = "wayland";
    #WLR_DRM_NO_ATOMIC = "1";
  };
}