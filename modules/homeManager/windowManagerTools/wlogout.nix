{host, pkgs, ...}:
{
  programs.wlogout = 
  {
    enable = false;
    layout =
    [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "lock";
        action = "";
        text = "Lock";
        keybind = "p";
      }
      {
        label = "logout";
        action = "";
        text = "Logout";
        keybind = "l";
      }
    ];
  };
}