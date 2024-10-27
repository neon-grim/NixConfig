{pkgs, ...}:
{
  programs.fastfetch =
  {
    enable = true;
    settings =
    {
      logo =
      {
        source = "~/Pictures/ProfilePictures/fury_logo.jpg";
        padding =
        {
          top = 2;
          left = 3;
        };
        width = 40;
      };
      modules =
      [
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "host";
          key = " PC";
          keyColor = "green";
        }
        {
          type = "cpu";
          key = "│ ├";
          showPeCoreCount = true;
          keyColor = "green";
        }
        {
          type = "gpu";
          key = "│ ├󰍛";
          keyColor = "green";
        }
        {
          type = "memory";
          key = "└ └";
          keyColor = "green";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Software──────────────────────┐";
        }
        {
          type = "os";
          key = " OS";
          keyColor = "yellow";
        }
        {
          type = "kernel";
          key = "│ ├";
          keyColor = "yellow";
        }
        {
          type = "vulkan";
          key = "│ ├";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = "└ └";
          keyColor = "yellow";
        }
        "break"
        {
          type = "wm";
          key = "󰇄 DE";
          keyColor = "blue";
        }
        {
          type = "lm";
          key = "│ ├󰍂";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = "└ └";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Theming───────────────────────┐";
        }
        {
          type = "theme";
          key = "󰉼 GTK";
          keyColor = "cyan";
        }
        {
          type = "cursor";
          key = "│  ├󰇀";
          keyColor = "cyan";
        }
        {
          type = "icons";
          key = "│  ├";
          keyColor = "cyan";
        }
        {
          type = "font";
          key = "└  └󰗧";
          keyColor = "cyan";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌────────────────────Uptime / Age────────────────────┐";
        }
        {
          type = "command";
          key = "  OS Age ";
          keyColor = "magenta";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "  Uptime ";
          keyColor = "magenta";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
      ];
    };
  };
}
