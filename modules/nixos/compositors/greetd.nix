{pkgs, user, config, lib, ...}:
let
  # Home Manager Options
  mainMonName = config.home-manager.users.${user}.desktop.mainMon.desc;
  kbLayout = config.home-manager.users.${user}.desktop.system.kb.layout;
  kbVariant = config.home-manager.users.${user}.desktop.system.kb.variant;
  # Compositor Config
  niriConf = pkgs.writeText "niriGtkGreetConfig" 
  ''
    spawn-sh-at-startup "swaybg -c 000000 & ${lib.getExe pkgs.regreet}; niri msg action quit --skip-confirmation"
    hotkey-overlay {
      skip-at-startup
    }
    gestures {
      hot-corners {
        off
      }
    }
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
    }
    output "${mainMonName}" {
      focus-at-startup
      position x=0 y=0
    }
    window-rule {
      open-on-output "${mainMonName}"
    }
  '';
in
{
  environment.systemPackages = with pkgs;
  [
    tuigreet
  ];
  services.greetd =
  {
    enable = true;
    settings =
    {
      default_session =
      {
        command = 
        (
          "${pkgs.tuigreet}/bin/tuigreet --time --issue --remember --remember-session --user-menu --asterisks " +
          "--theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red"
        );
        user = "${user}";
      };
    };
  };
}