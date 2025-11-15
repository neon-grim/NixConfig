{config, lib, ...}:
let
  cursorSize = toString config.desktop.style.cursorSize;
in
{
  desktop.niri.environmentVariables = lib.mkIf (config.desktop.system.compositors.niri.enable)
  ''
    environment {
      CLUTTER_BACKEND "wayland"
      GDK_BACKEND "wayland"
      SDL_VIDEODRIVER "wayland"
      QT_QPA_PLATFORM "wayland;xcb"
      QT_AUTO_SCREEN_SCALE_FACTOR "1.25"
      QT_WAYLAND_DISABLE_WINDOWDECORATION "1"
      XCURSOR_SIZE "${cursorSize}"
    }
  '';
}