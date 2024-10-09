{config, ...}:
let
  cursorSize = config.desktop.style.cursorSize;
in
{
  wayland.windowManager.hyprland.settings =
  {
    env =
    [
      "CLUTTER_BACKEND,wayland"
      "GDK_BACKEND,wayland,x11,*"
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "XCURSOR_SIZE,${toString cursorSize}"
      "HYPRSHOT_DIR,$XDG_PICTURES_DIR/sc"
    ];
  };
}