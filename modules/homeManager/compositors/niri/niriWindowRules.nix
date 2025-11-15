{config, ...}:
{
  desktop.niri.windowRules =
  ''
    window-rule {
      match app-id=r#"^steam_app_.*$"#
      open-fullscreen true
      variable-refresh-rate true
    }
    window-rule {
      match app-id=r#"^org\.wezfurlong\.wezterm$"#
      default-column-width {}
    }
    window-rule {
      match app-id=r#"librewolf$"# title="^Picture-in-Picture$"
      open-floating true
    }
    window-rule {
      geometry-corner-radius 4
      clip-to-geometry true
    }
    debug {
      skip-cursor-only-updates-during-vrr
    }
  '';
}