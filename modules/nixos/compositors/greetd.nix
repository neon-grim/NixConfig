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
  programs.regreet =
  {
    enable = true;
    cursorTheme.name = "Bibata-Original-Classic";
    iconTheme.name = "Dracula";
    settings =
    {
      default_session = "Niri";
    };
  };
  services.greetd =
  {
    enable = true;
    settings =
    {
      default_session =
      {
        command = "${lib.getExe pkgs.niri} --config ${niriConf}";
        user = "${user}";
      };
    };
  };
}