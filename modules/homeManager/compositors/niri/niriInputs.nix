{config, ...}:
let
  kbLayout = config.desktop.system.kb.layout;
  kbVariant = config.desktop.system.kb.variant;
in
{
  desktop.niri.input =
  ''
    input {
      keyboard {
        numlock
        xkb {
          layout "${kbLayout}"
          variant "${kbVariant}"
        }
      }
      mouse {
        accel-speed 1
        accel-profile "flat"
      }
      warp-mouse-to-focus
      focus-follows-mouse max-scroll-amount="0%"
    }
  '';
}
