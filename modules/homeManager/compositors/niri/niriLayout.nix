{config, ...}:
let
  accentDefault = config.desktop.theming.palette.accentDefault;
  accentDark = config.desktop.theming.palette.accentDark;
in
{
  desktop.niri.layout =
  ''
    layout {
      gaps 4
      center-focused-column "never"
      preset-column-widths {
        proportion 0.33333
        proportion 0.5
        proportion 0.66667
      }
      default-column-width { 
        proportion 0.5 
      }
      focus-ring {
        width 2
        active-color "#${accentDefault}"
        inactive-color "#${accentDark}aa"
      }
    }
    hotkey-overlay {
      skip-at-startup
    }
    gestures {
      hot-corners {
        off
      }
    }
    overview {
      backdrop-color "#${accentDark}"
    }
  '';
}