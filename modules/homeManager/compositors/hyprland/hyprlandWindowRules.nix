{lib, config, ...}:
{
  wayland.windowManager.hyprland.settings.windowrule = lib.mkIf (config.desktop.system.compositors.hyprland.enable)
  [
    # Gaming
    "workspace 1 silent, class:^(steam_app_.*)$"
    "tag game, fullscreen:1, class:^(steam_app_.*)$"
    "fullscreenstate 2 2, tag:game, class:^(steam_app_.*)$"
    "immediate, fullscreenstate:2 2, tag:game, class:^(steam_app_.*)$"
    "renderunfocused, fullscreenstate:2 2, tag:game, class:^(steam_app_.*)$"
    "workspace 1 silent, class:^(gamescope)$"
    "immediate, class:^(gamescope)$"
    # File-explorer
    "center 1, floating:1, xwayland:0, title:^(.*)$"
    "float, floating:0, title:^([O-o]pen.*)$"
    "float, floating:0, title:^([L-l]oad.*)$"
    "float, floating:0, title:^([S-s]ave.*)$"
    "float, floating:0, title:^([S-s]elect.*)$"
    "float, floating:0, title:^([C-c]hoose.*)$"
    "size 70% 70%, floating:1, title:^([O-o]pen.*)$"
    "size 70% 70%, floating:1, title:^([S-s]ave.*)$"
    "size 70% 70%, floating:1, title:^([L-l]oad.*)$"
    "size 70% 70%, floating:1, title:^([S-s]elect.*)$"
    "size 70% 70%, floating:1, title:^([C-c]hoose.*)$"
    # Prevent
    "suppressevent maximize, class:.*"
    # Workspace
    "workspace special:magic, class:^(kitty)$"
  ];
}