{config, lib, ...}:
let
  mainMonDesc = config.desktop.mainMon.desc;
in 
{
  desktop.niri.windowRules =
  ''
    window-rule {
      geometry-corner-radius 4
      clip-to-geometry true
    }
    window-rule {
      match app-id=r#"^com\..*\.gpu_screen_recorder$"#
      open-floating false
    }
    window-rule {
      match app-id=r#"^steam_app_.*$"#
      open-on-output "${mainMonDesc}"
      open-fullscreen true
      variable-refresh-rate true
    }
    debug {
      skip-cursor-only-updates-during-vrr
    }
  '';
}