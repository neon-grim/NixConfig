{config, ...}:
let
  cursorSize = toString config.desktop.style.cursorSize;
in
{
  wayland.windowManager.hyprland.settings =
  {
    env =
    [
      "XDG_SESSION_TYPE,wayland"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "CLUTTER_BACKEND,wayland"
      "GDK_BACKEND,wayland"
      "SDL_VIDEODRIVER,wayland"
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1.25"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "XCURSOR_SIZE,${cursorSize}"
      "HYPRSHOT_DIR,$XDG_PICTURES_DIR/ScreenShots"
      "STEAM_FORCE_DESKTOPUI_SCALING,1.25"
    ];
  };
}