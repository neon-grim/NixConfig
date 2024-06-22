{host, ...}:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    cursorSize;
in
{
  environment.sessionVariables =
  {
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    #SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XCURSOR_SIZE = cursorSize;
    # User dirs
    XDG_DESKTOP_DIR= "$HOME/Desktop";
    XDG_DOCUMENTS_DIR= "$HOME/Documents";
    XDG_DOWNLOAD_DIR= "$HOME/Downloads";
    XDG_MUSIC_DIR= "$HOME/Music";
    XDG_PICTURES_DIR= "$HOME/Pictures";
    XDG_PUBLICSHARE_DIR= "$HOME/Public";
    XDG_TEMPLATES_DIR= "$HOME/Templates";
    XDG_VIDEOS_DIR= "$HOME/Videos";
    # Config dirs
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };
}